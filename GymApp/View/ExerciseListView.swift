//
//  ExerciseListView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var viewModel: ExerciseListViewModel
    @State private var searchText = ""
    
    init(_ viewModel: ExerciseListViewModel) {
        self.viewModel = viewModel
    }
    
    var filteredExercises: [Exercise] {
        if searchText.isEmpty {
            return viewModel.exercises
        }
        return viewModel.exercises.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        List {
            ForEach(ExerciseCategory.allCases, id: \.self) { category in
                let exercisesInCategory = filteredExercises.filter { $0.category == category }
                if !exercisesInCategory.isEmpty {
                    Section(header: Text(category.rawValue)) {
                        ForEach(exercisesInCategory) { exercise in
                            NavigationLink(
                                destination: ExerciseDetailView(
                                    viewModel: ExerciseDetailViewModel(exercise: exercise)
                                )
                            ) {
                                ExerciseRowView(exercise: exercise)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Exercises")
        .searchable(text: $searchText, prompt: "Search exercises...")
    }
}

struct ExerciseRowView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(exercise.name)
                .font(.headline)
            
            HStack(spacing: 8) {
                Label(exercise.category.rawValue, systemImage: "dumbbell")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Label(exercise.type.rawValue, systemImage: "figure.walk")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                if !exercise.data.isEmpty {
                    Spacer()
                    Text("\(exercise.data.count) sets")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

//#Preview {
//    let exercises: [Exercise] = [
//        Exercise(name: "Curl", category: "Brazo", type: "Pesas"),
//        Exercise(name: "Press", category: "Pecho", type: "Pesas"),
//        Exercise(name: "Remo", category: "Espalda", type: "Maquina")]
//    ExerciseListView(exercises: exercises)
//}
