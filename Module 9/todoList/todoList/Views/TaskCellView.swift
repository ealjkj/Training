//
//  TaskCellView.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI

struct TaskCellView: View {
    @StateObject private var viewModel = TasksListViewModel()
    
    var task: Task
    
    init(_ task: Task) {
        self.task = task
    }
    
    var body: some View {
        HStack {
            
            CheckBoxButton(active: task.completed) {
                print("Checkbox pressed")
                viewModel.ToggleTask(task: task)
            }
            .frame(width: 35, height: 35)
                
            VStack(alignment: .leading) {
                Text(task.title)
                    .fontWeight(.semibold)
                Text(task.completed ? "Completed" : "Pending")
                    .foregroundStyle(task.completed ? . green : .red)
                    .fontWeight(.light)
            }
            
            Spacer()
            Text(task.createdDate.formatted(date: .abbreviated, time: .shortened))
                .font(.subheadline)
                .frame(width: 100)
        }
    }
}

#Preview {
    TaskCellView(Task.examples[0])
        .padding(.horizontal)
}
