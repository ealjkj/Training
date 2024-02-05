//
//  TodoList.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI

struct TodoList: View {
    @StateObject private var viewModel = TasksListViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CDTask.createdDate, ascending: true)],
        animation: .default) private var tasks: FetchedResults<CDTask>
    
    @State private var isCreationShowing = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { cdtask in
                    let task = Task.fromCDTask(cdtask)
                    NavigationLink(value: task) {
                        TaskCellView(task)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let cdtask = tasks[index]
                        
                        viewModel.deleteTask(task: Task.fromCDTask(cdtask))
                        }
                })
            }
            .navigationTitle("To-do List")
            .navigationDestination(for: Task.self) { task in
                TaskDetailsView(task: task)
            }
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                
                ToolbarItem {
                    Button("PLUS", systemImage: "plus") {
                       isCreationShowing = true
                    }
                }
            }
            .sheet(isPresented: $isCreationShowing, content: {
                CreateTaskView()
            })
        }
    }
}

#Preview {
    TodoList()
}
