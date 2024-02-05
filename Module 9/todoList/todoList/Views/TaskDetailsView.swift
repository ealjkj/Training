    //
//  TaskDetailsView.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI

struct TaskDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = TasksListViewModel()
    
    var  task: Task
    
    @State private var title : String
    @State private var completed : Bool
    
    var body: some View {
        Form {
            Section("Select title") {
                TextField("Task title", text: $title)
            }
            
            Toggle("Completed", isOn: $completed)
        }
        .toolbar {
            Button("Save") {
                viewModel.updateTask(task: task, newTitle: title, newStatus: completed)
                
                dismiss()
            }
        }
    }
    
    init(task: Task) {
        self.task = task
        
        self._title = .init(initialValue: task.title)
        self._completed = .init(initialValue: task.completed)
    }
}

#Preview {
    NavigationStack {
        TaskDetailsView(task: Task.examples[0])
    }
}
