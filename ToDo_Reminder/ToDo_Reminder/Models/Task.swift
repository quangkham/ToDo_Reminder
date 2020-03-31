//
//  Task.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 30/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import Foundation
struct Task  : Identifiable , Codable {
    
    var id : String = UUID().uuidString
    var title : String
    var priority : TaskPriority
    var isCompleted : Bool
    
}

enum TaskPriority : Int , Codable {
    
    case high
    case medium
    case low
    
}

#if DEBUG
let testDataTasks = [
    
    Task(title: "Implement UI", priority: .medium, isCompleted: false),
    Task(title: "Connect to Firebase", priority: .medium, isCompleted: false),
    Task(title: "????", priority: .high, isCompleted: false),
    Task(title: "PROFIT!!!", priority: .high, isCompleted: false)
    
    ]
#endif
