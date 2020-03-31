//
//  TaskListViewModel.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 30/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import SwiftUI
import Combine
import Resolver



class TaskListViewModel: ObservableObject {
  @Published var taskCellViewModels = [TaskCellViewModel]()
    @Published var taskRespository : TaskRespository = Resolver.resolve()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    taskRespository.$tasks.map{ tasks in
        tasks.map{ task in
            
            TaskCellViewModel(task: task)
        }
    }.assign(to: \.taskCellViewModels, on: self)
    .store(in: &cancellables)
    
  }
  
  func removeTasks(atOffsets indexSet: IndexSet) {
//    remove from repo
    let viewModels = indexSet.lazy.map{self.taskCellViewModels[$0]}
    viewModels.forEach{ taskCellVM in
        taskRespository.removeTask(taskCellVM.task)
    }
//    remove from VM
//    taskCellViewModels.remove(atOffsets: indexSet)
  }
  
  func addTask(task: Task) {
    taskRespository.addTask(task)
    
  }
}



struct TaskListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
