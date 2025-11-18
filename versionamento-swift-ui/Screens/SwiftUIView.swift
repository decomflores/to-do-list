//
//  SwiftUIView.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    var tasks: [String] = [
        "almoçar",
        "reunião",
        "mercado",
        "estudar",
        "cozinhar"
    ]
    
    var body: some View {
        
        List (tasks, id: \.self) { task in
            Text(task)
        }
    }
}


#Preview {
    Tasks()
}
