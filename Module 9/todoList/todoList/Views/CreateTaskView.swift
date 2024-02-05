//
//  CreateTaskView.swift
//  todoList
//
//  Created by intekglobal02 on 2/4/24.
//

import SwiftUI

struct CreateTaskView: View {
    @StateObject var viewModel = TasksListViewModel()
    @State private var taskTitle = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextField("Task title", text: $taskTitle)
            Button("Create") {
                viewModel.createTask(taskTitle)
                dismiss()
            }
            .buttonStyle(.bordered)
            .disabled(taskTitle == "")
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    NavigationStack {
        CreateTaskView()
    }
}
