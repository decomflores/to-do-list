//
//  AddTask.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 21/11/25.
//

import SwiftUI
import SwiftData

struct AddTask: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    @State var category: TaskCategory?
    @State var details: String = ""
    @State var missingInfos: Bool = false
    
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
                    
                    HStack(spacing: 12) {
                        Image(systemName: category?.imageName ?? "list.bullet")
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .foregroundStyle(.accent)
                            )
                        
                        Text("Category")
                            .padding(.vertical, 11)
                        //Segunda opção .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        
                        Menu {
                            
                            ForEach(TaskCategory.allCases) { category in
                                
                                Button(category.rawValue, systemImage: category.imageName) {
                                    self.category = category
                                }
                                
                            }
                            
                        } label: {
                            HStack {
                                Text(category?.rawValue ?? "Select")
                                
                                Image(systemName: "chevron.up.chevron.down")
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundStyle(.backgroundTertiary)
                    )
                    
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
            .alert("Missing Infos", isPresented: $missingInfos, actions: {
                Button("Ok", role: .cancel) {}
            })
            .toolbar {
                
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "paperplane") {
                        
                        if let category, !name.isEmpty, !details.isEmpty {
                            let newTask = Task(name: name, details: details, category: category, isCompleted: false)
                            
                            modelContext.insert(newTask)
                            try? modelContext.save()
                            
                            dismiss()
                            
                        } else {
                            missingInfos = true
                        }
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
