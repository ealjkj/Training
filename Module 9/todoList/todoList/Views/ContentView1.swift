//
//  ContentView.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI
import CoreData

struct ContentView1: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CDTask.createdDate, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<CDTask>

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { cdtask in
                    NavigationLink {
                        Text("Item at \(cdtask.createdDate!, formatter: itemFormatter)")
                    } label: {
                        TaskCellView(Task.fromCDTask(cdtask))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTask) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addTask() {
        withAnimation {
            let newTask = CDTask(context: viewContext)
            newTask.createdDate = Date()
            newTask.completed = false
            newTask.title = "Example"
            newTask.id = UUID()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
//    ContentView1().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    ContentView1().environment(\.managedObjectContext, PersistentStorage.shared.context)
}
