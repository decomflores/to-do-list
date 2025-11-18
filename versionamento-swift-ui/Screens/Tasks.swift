//
//  SwiftUIView.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    var tasks: [Task] = [
        Task(name: "Almoço", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "Janta", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "Lanche", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "Café da Manhã", details: "no RU", category: .fitness, isCompleted: false)
    ]
    
    var body: some View {
        
        if tasks.isEmpty {
            EmptyStateView()
        } else {
            List (tasks) { task in
                
                TaskView(task: task)
                    .listRowInsets(EdgeInsets())
                
            }
        }
    }
}


#Preview {
    Tasks()
}
