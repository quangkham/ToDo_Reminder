//
//  TaskListViewModel.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 30/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import SwiftUI
import Combine



class TaskListViewModel: ObservableObject {
  @Published var taskCellViewModels = [TaskCellViewModel]()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self.taskCellViewModels = testDataTasks.map { task in
      TaskCellViewModel(task: task)
    }
  }
  
  func removeTasks(atOffsets indexSet: IndexSet) {
    taskCellViewModels.remove(atOffsets: indexSet)
  }
  
  func addTask(task: Task) {
    taskCellViewModels.append(TaskCellViewModel(task: task))
  }
}



struct TaskListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
