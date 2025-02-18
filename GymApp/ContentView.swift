//
//  ContentView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            let exercises: [Exercise] = [
                Exercise(
                    name: "Bicep Curl",
                    category: .strength,
                    type: .pushPull,
                    data: []
                ),
                Exercise(
                    name: "Bench Press",
                    category: .strength,
                    type: .compound,
                    data: []
                ),
                Exercise(
                    name: "Pull-ups",
                    category: .bodyweight,
                    type: .compound,
                    data: []
                ),
                Exercise(
                    name: "Running",
                    category: .cardio,
                    type: .endurance,
                    data: []
                ),
                Exercise(
                    name: "Yoga Stretch",
                    category: .flexibility,
                    type: .mobility,
                    data: []
                )
            ]
            
            let viewModel = ExerciseListViewModel(exercises: exercises)
            ExerciseListView(viewModel)
        }
    }
}

// Preview provider for SwiftUI canvas
#Preview {
    ContentView()
}
