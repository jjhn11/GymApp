//
//  AddViewModel.swift
//  GymApp
//
//  Created by Developer on 17/02/25.
//

import SwiftUI

class AddExerciseDataViewModel: ObservableObject {
    @Published var exercise: Exercise
    private var originalExercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
        self.originalExercise = exercise
        
        // Add initial set if exercise has no data
        if exercise.data.isEmpty {
            self.exercise.data.append(ExerciseData(set: 1, reps: 1, weight: 1))
        }
    }
    
    func addSet() {
        let nextSet = exercise.data.count + 1
        exercise.data.append(ExerciseData(
            set: nextSet,
            reps: 1,
            weight: 1
        ))
    }
    
    func deleteSet(at offsets: IndexSet) {
        exercise.data.remove(atOffsets: offsets)
        // Reindex remaining sets
        for i in 0..<exercise.data.count {
            exercise.data[i].set = i + 1
        }
    }
}
