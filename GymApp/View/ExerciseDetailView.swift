//
//  ExerciseDetailView.swift
//  GymApp
//
//  Created by Developer on 12/02/25.
//

import SwiftUI

struct ExerciseDetailView: View {
    var exercise: Exercise
    @State var showSheet = false
    let btnAdd: Image = Image(systemName: "plus.circle")
    
        
    
    
    
    var body: some View {
        VStack(alignment: .center){
            Text(exercise.name)
                .font(.title)
            VStack(alignment: .trailing){
                Text(exercise.type)
                    .font(.caption)
                Text(exercise.category)
                    .font(.caption)
            }.frame(width: 300)
          
            VStack{}.frame(width: 300, height: 300)
            
            
            
            Rectangle()
                .frame(width: 300, height: 60)
                .foregroundStyle(Color.cyan)
                .cornerRadius(20)
                .onTapGesture {
                    showSheet.toggle()
                }
                .overlay(content: {
                    btnAdd
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                })
                .sheet(isPresented: $showSheet){
                    } content: {
                        Text("Hello, World!")
                    }
        }
        
    }
}

#Preview {
    
    ExerciseDetailView(exercise: Exercise(name: "Curl", category: "Brazo", type: "Pesas"))
    
}
