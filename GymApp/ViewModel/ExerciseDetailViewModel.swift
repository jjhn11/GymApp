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
    let btnAdd: Image = Image(systemName: "plus.circle")
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
}
