//
//  HeaderView.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 18/11/25.
//

import SwiftUI

struct HeaderView: View {
    
    var taskCategory: TaskCategory
    
    var body: some View {
        Text(taskCategory.rawValue.uppercased())
            .foregroundStyle(.labelSecondary)
            .font(.system(.subheadline, weight: .semibold))
            .padding(.horizontal)
            .padding(.vertical, 11)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeaderView(taskCategory: .education)
}
