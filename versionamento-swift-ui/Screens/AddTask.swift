//
//  AddTask.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 21/11/25.
//

import SwiftUI

struct AddTask: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var details: String = ""
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Task")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal, 8)
                        TextField("Your task name here", text: $name)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                    }
                    
//                    input categoria
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Details")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal, 8)
                        TextField("More details about the task", text: $details, axis: .vertical)
                            .lineLimit(5...10)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                    }
                }
                
            }
            
            
            .padding(.top)
            .padding(.horizontal)
            .background(.backgroundSecondary)
            .navigationTitle(Text("Add Task"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "paperplane") {
                        //                            to do
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
        }
    }
}

#Preview {
    AddTask()
}
