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
    let category: String
    let type: String
}

