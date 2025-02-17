//
//  AddView.swift
//  GymApp
//
//  Created by Developer on 13/02/25.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var viewModel: AddExerciseViewModel
    
    var body: some View {
        Text("Ejercicio").fontWeight(.bold).padding(20)
        List {
            ForEach($viewModel.exercise.data) { $dato in
                VStack{
                    HStack{
                        Text("Set \($dato.set.wrappedValue)")
                    }
                    HStack{
                        Picker("Reps",selection:
                                $dato.reps) {
                            ForEach(0 ..< 31) { rep in
                                Text("\(rep)")
                            }
                        } .pickerStyle(.menu)
                    }
                    HStack(){
                        Picker("Peso",selection: $dato.weight) {
                            ForEach(0 ..< 400) { weight in
                                Text("\(weight)")
                            }
                        } .pickerStyle(.menu)
                        Text("lbs")
                    }
                }
            }
        }
        
        Rectangle()
            .frame(width: 300, height: 60)
            .foregroundStyle(Color.cyan)
            .cornerRadius(20)
            .onTapGesture {
                viewModel.addSet()
                print(viewModel.exercise.data)
            }
            .overlay(content: {
                viewModel.btnAdd
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
            })
        
    }
}

//#Preview {
//    AddView()
//}
