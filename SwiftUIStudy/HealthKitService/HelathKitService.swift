//
//  HelathKitService.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/03/01.
//

import Foundation
import HealthKit
import Combine

final class HealthKitService {
  static let shared = HealthKitService()
  
  private let store = HKHealthStore()
  
  private let typesToRead: Set<HKObjectType> = [
    HKObjectType.workoutType(),
    HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
    HKObjectType.activitySummaryType()
  ]
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  private func requestAuthorizationIfNeeded() -> Deferred<Future<Bool, HealthKitError>> {
    Deferred {
      Future { [unowned self] promise in
        guard HKHealthStore.isHealthDataAvailable() else {
          promise(.failure(HealthKitError.unsupported))
          return
        }
        
        self.store.requestAuthorization(toShare: [],  read: typesToRead) { authSuccess, error in
          guard error == nil else {
            print("HealthKit authorization error:", error!.localizedDescription)
            
            promise(.failure(HealthKitError.unauthorized))
            return
          }
          
          if authSuccess {
            promise(.success(true))
          } else {
            promise(.failure(HealthKitError.unauthorized))
          }
        }
      }
    }
  }
  
  func startQueryForActivitySummary() -> AnyPublisher<ActivityModel, HealthKitError> {
    let subject = PassthroughSubject<ActivityModel, HealthKitError>()
    requestAuthorizationIfNeeded()
      .sink { completion in
        switch completion {
        case .finished:
          break
        case .failure(_):
          subject.send(completion: completion)
        }
        
      } receiveValue: { [weak self] _ in
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(
          withStart: startOfDay,
          end: now,
          options: .strictStartDate
        )
        
        let query = HKActivitySummaryQuery(predicate: predicate) { (query, summaries, error) -> Void in
          if let summaries = summaries {
            if let summary = summaries.first {
              let activeEnergyBurned = summary.activeEnergyBurned.doubleValue(for: HKUnit.kilocalorie())
              let activeEnergyBurnedGoal = summary.activeEnergyBurnedGoal.doubleValue(for: HKUnit.kilocalorie())
              
              let exerciseTime = summary.appleExerciseTime.doubleValue(for: HKUnit.minute())
              let exerciseTimeGoal = summary.appleExerciseTimeGoal.doubleValue(for: HKUnit.minute())
              let exerciseTimePercent = round(exerciseTime/exerciseTimeGoal)
              
              let standMinute = summary.appleStandHours.doubleValue(for: .count())
              let standGoalMinute = summary.appleStandHoursGoal.doubleValue(for: .count())
              let standPercent = round(standMinute/standGoalMinute)
              
              let result = ActivityModel(
                activeEnergyBurned: ActiveEnergyBurned(activeEnergyBurned: activeEnergyBurned,
                                                       activeEnergyBurnedGoal: activeEnergyBurnedGoal),
                exerciseTime: exerciseTime,
                exerciseTimeGoal: exerciseTimeGoal,
                exerciseTimePercent: exerciseTimePercent,
                standMinute: standMinute,
                standGoalMinute: standGoalMinute,
                standPercent: standPercent)
              
              subject.send(result)
              subject.send(completion: .finished)
            } else {
              subject.send(completion: .failure(.invalidResults))
            }
          } else {
            subject.send(completion: .failure(.invalidResults))
          }
        }
        self?.store.execute(query)
      }.store(in: &cancellableSet)
    return subject.eraseToAnyPublisher()
  }
}

