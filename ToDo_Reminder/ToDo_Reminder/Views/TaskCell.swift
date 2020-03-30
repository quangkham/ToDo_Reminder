//
//  TaskCell.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 30/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import SwiftUI
import Combine

struct TaskCell: View {
    
    @ObservedObject var taskCellVM : TaskCellViewModel
    
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.completionStateIconName)
            .resizable()
            .frame(width : 20 ,height : 20)
            .onTapGesture {
                    self.taskCellVM.task.isCompleted.toggle()
            }
            TextField("Enter task title" , text : $taskCellVM.task.title , onCommit: {
                if !self.taskCellVM.task.title.isEmpty{
                    self.onCommit(.success(self.taskCellVM.task))
                }
                else {
                    self.onCommit(.failure(.empty))
                }
                
            }).id(taskCellVM.id)
            
        }
    }
}

enum InputError: Error {
  case empty
}

