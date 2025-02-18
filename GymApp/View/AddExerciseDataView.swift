//
//  AddView.swift
//  GymApp
//
//  Created by Developer on 13/02/25.
//

import SwiftUI

struct AddExerciseDataView: View {
    @ObservedObject var viewModel: AddExerciseViewModel
    @Environment(\.dismiss) var dismiss
    let onSave: (Exercise) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($viewModel.exercise.data) { $data in
                        SetInputSection(data: $data)
                    }
                    .onDelete(perform: viewModel.deleteSet)
                }
                
                // Add Set Button
                Button(action: viewModel.addSet) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Set")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("\(viewModel.exercise.name) Sets")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        onSave(viewModel.exercise)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


// MARK: - SetInputSection
struct SetInputSection: View {
    @Binding var data: ExerciseData
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Set \(data.set)")
                    .font(.headline)
                Spacer()
            }
            
            HStack {
                // Reps Picker
                VStack(alignment: .leading) {
                    Text("Reps")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Picker("", selection: $data.reps) {
                        ForEach(0..<31) { rep in
                            Text("\(rep)").tag(rep)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                
                Spacer()
                
                // Weight Picker
                VStack(alignment: .leading) {
                    Text("Weight")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack {
                        Picker("", selection: $data.weight) {
                            ForEach(0..<401) { weight in
                                Text("\(weight)").tag(weight)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        
                        Text("lbs")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}
