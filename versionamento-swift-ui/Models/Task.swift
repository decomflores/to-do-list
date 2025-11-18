//
//  Task.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import Foundation

struct Task: Identifiable {
    var id: UUID = UUID()
    var name: String
    var details: String
    var category: TaskCategory
    var isCompleted: Bool
}
