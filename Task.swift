//
//  Task.swift
//  To-Do List
//
//  Created by Mithil on 23/11/25.
//

import Foundation

class Task {
    var name: String
    var isUrgent: Bool
    var dateCreated: Date
    
    init(name: String, isUrgent: Bool, dateCreated: Date) {
        self.name = name
        self.isUrgent = isUrgent
        self.dateCreated = dateCreated
    }
}

class TaskManager {
    static var shared = TaskManager()
    var tasks: [Task] = [
        Task(name: "Buy groceries", isUrgent: false, dateCreated: Date()),
        Task(name: "Finish Swift project", isUrgent: true, dateCreated: Date()),
    ]
    
    func addTask(ntask: Task) {
          
        tasks.append(ntask)
    }
    
    func deleteTask(at index: Int) {
        guard index >= 0 && index < tasks.count else { return }
        tasks.remove(at: index)
    }
}
