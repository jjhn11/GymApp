//
//  ExerciseDetailViewModel.swift
//  GymApp
//
//  Created by Developer on 17/02/25.
//

import SwiftUI

class ExerciseDetailViewModel: ObservableObject {
    @Published var exercise: Exercise
    @Published var showSheet = false
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    func updateExercise(_ updatedExercise: Exercise) {
        self.exercise = updatedExercise
    }
}
