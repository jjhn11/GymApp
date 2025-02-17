//
//  ExerciseListView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var viewModel: ExerciseListViewModel
    init(_ viewModel: ExerciseListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        List(viewModel.exercises) { exercise in
            NavigationLink(
                destination: ExerciseDetailView(
                    viewModel: ExerciseDetailViewModel(
                        exercise: exercise))) {
                            Text(exercise.name)
                        }
            
        }
        .navigationTitle("Ejercicios")
        
    }
}

//#Preview {
//    let exercises: [Exercise] = [
//        Exercise(name: "Curl", category: "Brazo", type: "Pesas"),
//        Exercise(name: "Press", category: "Pecho", type: "Pesas"),
//        Exercise(name: "Remo", category: "Espalda", type: "Maquina")]
//    ExerciseListView(exercises: exercises)
//}
