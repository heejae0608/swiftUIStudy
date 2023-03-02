//
//  HomeViewModel.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/03/01.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
  
  @Published var activityModel = ActivityModel(
    activeEnergyBurned:
      ActiveEnergyBurned(activeEnergyBurned: 0.0,
                         activeEnergyBurnedGoal: 0.0),
    exerciseTime: 0.0,
    exerciseTimeGoal: 0.0,
    exerciseTimePercent: 0,
    standMinute: 0,
    standGoalMinute: 0,
    standPercent: 0)
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  func updateActivity() {
    HealthKitService.shared.startQueryForActivitySummary()
      .receive(on: DispatchQueue.main)
      .first()
      .sink { completion in
        switch completion {
        case .finished:
          print("finished")
        case .failure(let result):
          switch result {
          case .unsupported:
            print("unsupported")
          case .unauthorized:
            print("unauthorized")
          case .invalidQuery:
            print("invalidQuery")
          case .invalidResults:
            print("invalidResults")
          case .wrapped(let error):
            print(error.localizedDescription)
          }
        }
      } receiveValue: { result in
        print(result)
        self.activityModel = result
      }.store(in: &cancellableSet)
  }
}
