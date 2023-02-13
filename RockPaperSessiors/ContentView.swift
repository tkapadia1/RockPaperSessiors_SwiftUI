//
//  ContentView.swift
//  RockPaperSessiors
//
//  Created on 29/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var winScore = 0
    @State private var loseScore = 0
    @State private var selectedImageName = "Rock"
    @State var selectedNumber = Int.random(in: 0...2)
    @State private var alertBool = false
    let array = ["Rock", "Paper", "Sessiors"]
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.mint,.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Image(array[selectedNumber])
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        
                        
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Wins: \(winScore)")
                            .font(.largeTitle)
                        Spacer()
                        Text("Loss: \(loseScore)")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Image(selectedImageName)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Spacer()
                    
                    HStack{
                        ForEach(0..<3){number in
                            Button{
                             selectedNumber = Int.random(in: 0...2)
                             actionTapped(number)
                            } label: {
                                Image(array[number])
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fit)
                            
                            }
                        }
                    }
                }
            }
            .navigationTitle("Rock Paper")
        }
        .alert("", isPresented: $alertBool) {
            Text("")
        }
    }
    func actionTapped(_ number: Int){
        selectedImageName = array[number]
        if selectedNumber == number + 1 {
            loseScore += 1
        }else if selectedNumber == number - 1 {
            winScore += 1
        }else if selectedNumber == number + 2{
            winScore += 1
        }else if selectedNumber == number - 2{
            winScore += 1
        }else{
            print("Same")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
