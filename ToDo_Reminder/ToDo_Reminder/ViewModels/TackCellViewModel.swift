//
//  TackCellViewModel.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 30/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import SwiftUI
import Combine

class TaskCellViewModel: ObservableObject, Identifiable  {
  @Published var task: Task
  var id: String = ""
  @Published var completionStateIconName = ""
  private var cancellables = Set<AnyCancellable>()
  
  static func newTask() -> TaskCellViewModel {
    TaskCellViewModel(task: Task(title: "", priority: .medium, isCompleted: false))
  }
  
  init(task: Task) {
    self.task = task
    
    $task
    .map { $0.isCompleted ? "checkmark.circle.fill" : "circle" }
      .assign(to: \.completionStateIconName, on: self)
      .store(in: &cancellables)

    $task
      .map { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
    
  }
  
}

