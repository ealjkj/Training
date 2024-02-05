//
//  Task.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id: UUID
    let title: String
    let completed: Bool
    let createdDate: Date
    
    
    init(id: UUID = UUID(), title: String, completed: Bool, createdDate: Date) {
        self.id = id
        self.title = title
        self.completed = completed
        self.createdDate = createdDate
    }
    
    static func fromCDTask(_ cdtask: CDTask) -> Task {
        let task = Task(id: cdtask.id!, title: cdtask.title!, completed: cdtask.completed, createdDate: cdtask.createdDate!)
        return task
    }
}

extension Task {
    static let examples : [Task] = [
        Task(title: "Complete SwiftUI tutorial", completed: false, createdDate: Date()),
        Task(title: "Write a blog post", completed: true, createdDate: Date().addingTimeInterval(-86400)), // 1 day ago
        Task(title: "Exercise for 30 minutes", completed: false, createdDate: Date().addingTimeInterval(-172800)), // 2 days ago
        Task(title: "Learn Core Data", completed: true, createdDate: Date().addingTimeInterval(-259200)), // 3 days ago
        Task(title: "Plan weekend trip", completed: false, createdDate: Date().addingTimeInterval(-345600)), // 4 days ago
        Task(title: "Read a book", completed: true, createdDate: Date().addingTimeInterval(-432000)), // 5 days ago
    ]
}
