//
//  HealthKitResult.swift
//  SwiftUIStudy
//
//  Created by 히재 on 2023/03/01.
//

import Foundation
import HealthKit

public enum HealthKitError: Error {
  case unsupported
  case unauthorized
  case invalidQuery
  case invalidResults
  case wrapped(Error)
}

public typealias HealthResult = Result<ActivityModel, HealthKitError>
