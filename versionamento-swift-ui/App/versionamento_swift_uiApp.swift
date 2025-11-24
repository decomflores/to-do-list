//
//  versionamento_swift_uiApp.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import SwiftUI
import SwiftData


@main
struct versionamento_swift_uiApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
        .modelContainer(for: Task.self)
    }
}
