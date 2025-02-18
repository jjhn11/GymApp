//
//  Exercise.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import Foundation

struct Exercise: Identifiable {
    
    let id: UUID = UUID()
    let name: String
    let category: ExerciseCategory
    let type: ExerciseType
    var data: [ExerciseData] = []
}

struct ExerciseData: Identifiable {
    var id: UUID = UUID()
    var set: Int
    var reps: Int
    var weight: Int
}

enum ExerciseCategory: String, Codable, CaseIterable {
    case strength = "Strength"
    case cardio = "Cardio"
    case flexibility = "Flexibility"
    case bodyweight = "Bodyweight"
}

enum ExerciseType: String, Codable, CaseIterable {
    case pushPull = "Push/Pull"
    case compound = "Compound"
    case isolation = "Isolation"
    case hiit = "HIIT"
    case endurance = "Endurance"
    case mobility = "Mobility"
}
