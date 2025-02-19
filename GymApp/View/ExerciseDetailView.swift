//
//  ExerciseDetailView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

// MARK: - ExerciseDetailView
struct ExerciseDetailView: View {
    @ObservedObject var viewModel: ExerciseDetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header Section
            VStack(spacing: 8) {
                Text(viewModel.exercise.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 12) {
                    ExerciseTagView(
                        text: viewModel.exercise.type.rawValue,
                        icon: "figure.walk",
                        color: .blue
                    )
                    
                    ExerciseTagView(
                        text: viewModel.exercise.category.rawValue,
                        icon: "dumbbell",
                        color: .purple
                    )
                }
            }
            .padding()
            .background(Color.white)
            
            if viewModel.exercise.data.isEmpty {
                EmptyStateView()
            } else {
                List {
                    Section(header:
                        HStack {
                            Text("Sets")
                                .font(.headline)
                            Spacer()
                            Text("\(viewModel.exercise.data.count) total")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    ) {
                        ForEach(Array(viewModel.exercise.data.enumerated()), id: \.element.id) { index, _ in
                            SetRow(data: $viewModel.exercise.data[index])
                        }
                        .onDelete { indexSet in
                            viewModel.exercise.data.remove(atOffsets: indexSet)
                            // Reindex remaining sets
                            for i in 0..<viewModel.exercise.data.count {
                                viewModel.exercise.data[i].set = i + 1
                            }
                        }
                    }
                }
            }
            
            // Add Button
            Button(action: { viewModel.showSheet.toggle() }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
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
        .sheet(isPresented: $viewModel.showSheet) {
            AddExerciseDataView(
                viewModel: AddExerciseDataViewModel(exercise: viewModel.exercise),
                onSave: { updatedExercise in
                    viewModel.updateExercise(updatedExercise)
                }
            )
        }
    }
}

// MARK: - Supporting Views
struct ExerciseTagView: View {
    let text: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.subheadline)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(color.opacity(0.1))
        .foregroundColor(color)
        .cornerRadius(8)
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "clipboard")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            Text("No sets recorded")
                .font(.headline)
            Text("Tap the button below to add your first set")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .padding()
    }
}

struct SetRow: View {
    @Binding var data: ExerciseData
    
    var body: some View {
        HStack {
            Text("Set \(data.set)")
                .fontWeight(.medium)
            
            Spacer()
            
            HStack(spacing: 16) {
                DataCell(title: "Reps", value: "\(data.reps)")
                DataCell(title: "Weight", value: "\(data.weight) lbs")
            }
        }
    }
}

//struct ExerciseDataListView: View {
//    let data: [ExerciseData]
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text("Data")
//                .font(.headline)
//                .padding(.horizontal)
//            
//            ForEach(data) { set in
//                HStack {
//                    Text("Set \(set.set)")
//                        .fontWeight(.medium)
//                    
//                    Spacer()
//                    
//                    HStack(spacing: 16) {
//                        DataCell(title: "Reps", value: "\(set.reps)")
//                        DataCell(title: "Weight", value: "\(set.weight) kg")
//                    }
//                }
//                .padding()
//                .background(Color.gray.opacity(0.1))
//                .cornerRadius(10)
//                .padding(.horizontal)
//            }
//        }
//    }
//}

struct DataCell: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}

