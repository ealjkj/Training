//
//  Task.swift
//  tasks
//
//  Created by intekglobal02 on 1/17/24.
//

import Foundation

struct Task : Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var description: String
}

struct TaskList {
    static var shared = TaskList()
    
    var tasks: [Task] = [Task(firstName: "Jorge", lastName: "Ballote", email: "a@a.com", description: "Do something"), Task(firstName: "Jose", lastName: "Doporto", email: "b@b.com", description: "Do something else"), Task(firstName: "Jose", lastName: "Pablo", email: "c@c.com", description: "Finish Resume")]
    private init() {}
    
    mutating func remove(at index: Int) {
        tasks.remove(at: index)
    }
    
    mutating func update(task: Task, newValue: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index] = newValue
        }
    }
}
