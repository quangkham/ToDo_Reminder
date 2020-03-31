//
//  AppDelelgate+Resolving.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 31/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    //register { TestTaskDataRespository() as TaskRespository }.scope(application)
    register { LocalTaskDataRespository() as TaskRespository }.scope(application)
  }
}
