//
//  ItemListViewModel.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import Foundation
import SwiftUI

class TasksListViewModel : ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CDTask.createdDate, ascending: true)],
        animation: .default) private var tasks: FetchedResults<CDTask>
    
    private let taskRepository = CDTaskRepositoryData()
    
    
    init() {
        
    }
    
    func createTask(_ title: String) {
        let task = Task(title: title, completed: false, createdDate: Date.now)
        taskRepository.create(task: task)
    }
    
    func ToggleTask(task: Task) {
        let newTask = Task(id: task.id, title: task.title, completed: !task.completed, createdDate: task.createdDate)
        
        if taskRepository.update(task: newTask) {
            print("Task updated")
            return
        }
        
        print("Task was not updated")
        
    }
    
    func updateTask(task: Task, newTitle: String, newStatus: Bool) {
        let newTask = Task(id: task.id, title: newTitle, completed: newStatus, createdDate: task.createdDate)
        
        if taskRepository.update(task: newTask) {
            print("Task updated")
        }
    }
    
    func deleteTask(task: Task) {
        if taskRepository.delete(task: task) {
            print("Task deleted")
        }
    }
    
}
