//
//  ExerciseDetailView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

struct ExerciseDetailView: View {
    @ObservedObject var viewModel: ExerciseDetailViewModel
    
    
    var body: some View {
        VStack(alignment: .center){
            Text(viewModel.exercise.name)
                .font(.title)
            VStack(alignment: .trailing){
                Text(viewModel.exercise.type)
                    .font(.caption)
                Text(viewModel.exercise.category)
                    .font(.caption)
            }.frame(width: 300)
          
            VStack{}.frame(width: 300, height: 300)
            
            
            
            Rectangle()
                .frame(width: 300, height: 60)
                .foregroundStyle(Color.cyan)
                .cornerRadius(20)
                .onTapGesture {
                    viewModel.showSheet.toggle()
                }
                .overlay(content: {
                    viewModel.btnAdd
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                })
                .sheet(isPresented: $viewModel.showSheet){
                    } content: {
                        AddView(viewModel: AddExerciseViewModel(exercise: viewModel.exercise))
                    }
        }
        
    }
}

//#Preview {
//    
//    ExerciseDetailView(exercise: Exercise(name: "Curl", category: "Brazo", type: "Pesas"))
//    
//}
