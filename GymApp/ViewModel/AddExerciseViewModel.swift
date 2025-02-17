//
//  AddViewModel.swift
//  GymApp
//
//  Created by Developer on 17/02/25.
//

import SwiftUI

class AddExerciseViewModel: ObservableObject {
    @Published var exercise: Exercise
    @Published var sets: Int
    @Published var reps: Int
    @Published var weight: Int
    let btnAdd: Image = Image(systemName: "plus.circle")
    init(exercise: Exercise, sets: Int = 1, reps: Int = 1, weight: Int = 1) {
        self.exercise = exercise
        self.sets = sets
        self.reps = reps
        self.weight = weight
        self.exercise.data.append(ExerciseData(set: sets, reps: 1, weight: 1))
    }
    
    func addSet() {
        sets += 1
        exercise.data.append(ExerciseData(set: sets, reps: 1, weight: 1))
    }
    
    
}
