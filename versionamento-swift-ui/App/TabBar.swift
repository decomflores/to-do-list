//
//  TabBar.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 24/11/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            
            Tab("Tasks", systemImage: "list.bullet.rectangle.portrait.fill") {
                
                NavigationStack {
                    Tasks()
                }
                
            }
            Tab("Profile", systemImage: "person.fill") {
                NavigationStack {
                    Profile()
                }
            }
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    Search()
                }
            }
        }
    }
}

#Preview {
    TabBar()
}
