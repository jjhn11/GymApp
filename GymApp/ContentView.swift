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
                Exercise(name: "Curl", category: "Brazo", type: "Pesas"),
                Exercise(name: "Press", category: "Pecho", type: "Pesas"),
                Exercise(name: "Remo", category: "Espalda", type: "Maquina")]
            let viewModel = ExerciseListViewModel(exercises: exercises)
            ExerciseListView(viewModel)
        }
        
        
    }
}

#Preview {
    ContentView()
}
