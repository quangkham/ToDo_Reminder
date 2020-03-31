//
//  BaseTaskRespositories.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 31/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import SwiftUI
import Disk


class BaseTaskRespository{
    @Published var tasks = [Task]()
}

protocol TaskRespository : BaseTaskRespository{
    func addTask(_ task : Task)
    func removeTask(_ task : Task)
    func updateTask(_ task : Task)
}

class TestTaskDataRespository : BaseTaskRespository ,TaskRespository ,ObservableObject{
    
    
    override  init() {
        super.init()
        self.tasks = testDataTasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where:{ $0.id == task.id}){
             tasks.remove(at: index)
        }
       
    }
    
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}){
            self.tasks[index] = task
        }
    }
}


class LocalTaskDataRespository : BaseTaskRespository , TaskRespository, ObservableObject{
    
    override init() {
        super.init()
        loadData()
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
        saveData()
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where:{ $0.id == task.id}){
             tasks.remove(at: index)
            saveData()
        }
       
    }
    
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}){
            self.tasks[index] = task
            saveData()
        }
    }
    
   private func loadData() {
     if let retrievedTasks = try? Disk.retrieve("tasks.json", from: .documents, as: [Task].self) {
       self.tasks = retrievedTasks
     }
   }
   
   private func saveData() {
     do {
       try Disk.save(self.tasks, to: .documents, as: "tasks.json")
     }
     catch let error as NSError {
       fatalError("""
         Domain: \(error.domain)
         Code: \(error.code)
         Description: \(error.localizedDescription)
         Failure Reason: \(error.localizedFailureReason ?? "")
         Suggestions: \(error.localizedRecoverySuggestion ?? "")
         """)
     }
   }
}
