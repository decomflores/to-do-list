//
//  TaskView.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import SwiftUI

struct TaskView: View {
    
    var task: Task
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            Button {
                 task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(task.isCompleted ? .accent : .gray3)
                    .frame(width: 22, height: 22)
            }
            
            Text(task.name)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding()
    }
}

#Preview {
    TaskView (task: Task(name: "Almoço", details: "no RU", category: .fitness, isCompleted: false))
}
