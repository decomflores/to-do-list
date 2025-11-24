//
//  AddTask.swift
//  versionamento-swift-ui
//
//  Created by aluno-01 on 21/11/25.
//

import SwiftUI
import SwiftData

struct UpInsertTask: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    var task: Task?
    
    @State var name: String = ""
    @State var category: TaskCategory?
    @State var details: String = ""
    @State var missingInfos: Bool = false
    
    @State var isCompleted: Bool = false
    
    var isEditting: Bool {
        task != nil
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
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
                        
                        if isEditting{
                            HStack(spacing: 16) {
                                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(isCompleted ? .accent : .gray3)
                                    .frame(width: 22, height: 22)
                                
                                Text("Status")
                                    .padding(.vertical, 11)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                            .onTapGesture {
                                isCompleted.toggle()
                            }
                        }
                        
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
                if isEditting {
                    
                    Spacer()
                    
                    Button{
                        if let task {
                            modelContext.delete(task)
                            dismiss()
                        }
                    } label: {
                        Text("Delete Task")
                            .fontWeight(.semibold)
                            .foregroundStyle(.error)
                            .padding(.vertical, 14)
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            }
                    }
                }
            }
            
            
            
            .padding(.top)
            .padding(.horizontal)
            .background(.backgroundSecondary)
            .navigationTitle(isEditting ? "Task details" : "New Task")
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
                    Button(isEditting ? "Done" : "Add", systemImage: isEditting ? "checkmark" : "paperplane") {
                        
                        if let category, !name.isEmpty, !details.isEmpty {
                            
                            if let task {
                                task.name = name
                                task.details = details
                                task.category = category
                                task.isCompleted = isCompleted
                            } else {
                                let newTask = Task(name: name, details: details, category: category, isCompleted: false)
                                
                                modelContext.insert(newTask)
                            }
                            
                            try? modelContext.save()
                            dismiss()

                            
                        } else {
                            missingInfos = true
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .onAppear {
                if let task {
                    name = task.name
                    category = task.category
                    details = task.details
                    isCompleted = task.isCompleted
                }
            }
            
        }
    }
}

#Preview {
    UpInsertTask(task: Task(name: "Teste1", details: "teste1", category: .education, isCompleted: false))
//    UpInsertTask()
}
