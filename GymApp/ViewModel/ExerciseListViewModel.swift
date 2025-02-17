//
//  ExerciseListViewModel.swift
//  GymApp
//
//  Created by Developer on 17/02/25.
//

import SwiftUI

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
    }
}
