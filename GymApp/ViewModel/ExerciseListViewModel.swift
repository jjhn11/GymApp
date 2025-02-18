//
//  ExerciseListViewModel.swift
//  GymApp
//
//  Created by Developer on 17/02/25.
//

import SwiftUI

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    
    init(exercises: [Exercise] = []) {
        self.exercises = exercises
    }
    
    func exercises(for category: ExerciseCategory) -> [Exercise] {
        exercises.filter { $0.category == category }
    }
    
    func addExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
    
    func deleteExercise(at indexSet: IndexSet) {
        exercises.remove(atOffsets: indexSet)
    }
    
    func moveExercise(from source: IndexSet, to destination: Int) {
        exercises.move(fromOffsets: source, toOffset: destination)
    }
}
