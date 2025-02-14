//
//  AddView.swift
//  GymApp
//
//  Created by Developer on 13/02/25.
//

import SwiftUI

struct AddView: View {
//    @Binding var exercise: Exercise
    @State private var sets: Int = 1
    @State private var data: [ExerciseData] = [ExerciseData(set:1, reps: 1, weight: 1)]
    let btnAdd: Image = Image(systemName: "plus.circle")
    
    var body: some View {
        Text("Ejercicio").fontWeight(.bold).padding(20)
        List {
            ForEach($data) { $dato in
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
                sets += 1
                data.append(ExerciseData(set: sets, reps: 1, weight: 1))
                print(data)
            }
            .overlay(content: {
                btnAdd
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
            })
        
    }
}

#Preview {
    AddView()
}
