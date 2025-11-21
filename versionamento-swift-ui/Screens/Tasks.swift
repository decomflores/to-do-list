//
//  SwiftUIView.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    @State var tasks: [Task] = [
        Task(name: "fitness", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "education", details: "no RU", category: .education, isCompleted: false),
        Task(name: "groceries", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "groceries", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "groceries", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "education", details: "no RU", category: .education, isCompleted: false),
        Task(name: "fitness", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "education", details: "no RU", category: .education, isCompleted: false),
        Task(name: "groceries", details: "no RU", category: .groceries, isCompleted: false)
    ]
    
    @State var addTask: Bool = false
    
    var groupedTasks: [TaskCategory: [Binding<Task>]] {
        Dictionary(grouping: $tasks, by: { $0.category.wrappedValue })
    }
    
    var sortedCategories: [TaskCategory] {
        groupedTasks.keys.sorted(by: { $0.rawValue < $1.rawValue })
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                if tasks.isEmpty {
                    EmptyStateView(addTask: $addTask)
                } else {
                    
                    List (sortedCategories) { category in
                        
                        HeaderView(taskCategory: category)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden, edges: .top)
                            .padding(.top, 20)
                        
                        if let categoryTasks = groupedTasks[category] {
                            
                            ForEach(categoryTasks) { task in
                                TaskView(task: task)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(task.id == categoryTasks.last?.id ? .hidden : .visible, edges: .bottom)
                                
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            
            .sheet(isPresented: $addTask, content: {
                AddTask()
                    .presentationDragIndicator(.visible)
            })
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        addTask = true
                    }
                    .buttonStyle(.borderedProminent)
                }
            }

        }
    }
}


#Preview {
    Tasks()
}
