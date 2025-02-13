//
//  ExerciseListView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

struct ExerciseListView: View {
    var exercises: [Exercise] = []
    var body: some View {
            List(exercises) { exercise in
                NavigationLink(
                    destination:ExerciseDetailView(exercise:exercise)) {
                    Text(exercise.name)
                }
            }
        .navigationTitle("Ejercicios")
        
    }
}

#Preview {
    let exercises: [Exercise] = [
        Exercise(name: "Curl", category: "Brazo", type: "Pesas"),
        Exercise(name: "Press", category: "Pecho", type: "Pesas"),
        Exercise(name: "Remo", category: "Espalda", type: "Maquina")]
    ExerciseListView(exercises: exercises)
}
