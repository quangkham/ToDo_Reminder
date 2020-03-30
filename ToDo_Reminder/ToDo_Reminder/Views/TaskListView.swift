//
//  TaskListView.swift
//  ToDo_Reminder
//
//  Created by Quang Kham on 30/03/2020.
//  Copyright © 2020 Quang Kham. All rights reserved.
//

import SwiftUI
import Combine

struct TaskListView: View {
    
    @ObservedObject var taskListVM = TaskListViewModel()
    var tasks : [Task] = testDataTasks
    @State var addNewItem = false
    var body: some View {
        
        NavigationView {
            VStack(alignment : .leading){
                List {
                    ForEach(taskListVM.taskCellViewModels){ taskcellVM in
                        TaskCell(taskCellVM: taskcellVM)
                    }.onDelete{ indexSet in
                        self.taskListVM.removeTasks(atOffsets: indexSet)
                    }
                if addNewItem{
                    TaskCell(taskCellVM: TaskCellViewModel.newTask()){ result in
                        if case .success(let task) = result{
                            self.taskListVM.addTask(task: task)
                        }
                        self.addNewItem.toggle()
                        
                    }
                }
                }
                
                Button(action : {self.addNewItem.toggle()}){
                    HStack{
                        Image(systemName: "plus.circle.fill").resizable()
                            .frame(width : 20 , height: 20)
                        Text("New Task")
                    }
                }
                .padding()
                .accentColor(Color.red)
            }
        .navigationBarTitle("Tasks")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}



