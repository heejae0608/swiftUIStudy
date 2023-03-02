//
//  ActivityModel.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/03/01.
//

import Foundation

public struct ActivityModel {
  let activeEnergyBurned: ActiveEnergyBurned
  
  let exerciseTime: Double
  let exerciseTimeGoal: Double
  let exerciseTimePercent: Double
  
  let standMinute: Double
  let standGoalMinute: Double
  let standPercent: Double
}

struct ActiveEnergyBurned {
  let activeEnergyBurned: Double
  let activeEnergyBurnedGoal: Double
  let activeEnergyBurnGoalPercent: Double
  
  let activeEnergyBurnedStr: String
  let activeEnergyBurnedGoalStr: String
  
  init(activeEnergyBurned: Double,
       activeEnergyBurnedGoal: Double) {
    self.activeEnergyBurned = activeEnergyBurned
    self.activeEnergyBurnedGoal = activeEnergyBurnedGoal
    self.activeEnergyBurnGoalPercent = round(activeEnergyBurned / activeEnergyBurnedGoal * 100)
    self.activeEnergyBurnedStr = String(format: "%.0f", activeEnergyBurned)
    self.activeEnergyBurnedGoalStr = String(format: "%.0f", activeEnergyBurnedGoal)
  }
}
