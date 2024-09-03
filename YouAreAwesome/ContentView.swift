//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theodore Utomo on 8/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "Namaste"
    var body: some View {
        
        //            Rectangle()
        //                .fill(
        //                    Gradient(colors: [.maroonBC, .skyBlue])
        //                )
        //                .ignoresSafeArea()
        
        //            Rectangle()
        //                .fill(
        //                    LinearGradient(
        //                        colors: [.red, .indigo],
        //                        startPoint: .topLeading,
        //                        endPoint: .bottomTrailing
        //                    )
        //                )
        
        //            Rectangle()
        //                .fill(
        //                    RadialGradient(
        //                        colors: [.red, .white, .blue],
        //                        center: .center,
        //                        startRadius: 50,
        //                        endRadius: 100
        //                    )
        //                )
        
        //            Rectangle()
        //                .fill(
        //                    AngularGradient(
        //                        colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple],
        //                        center: .center
        //                    )
        //                )
        
        
        GeometryReader {geometry in
            VStack {
                //                Text("You have Skills!")
                //                    .font(.largeTitle)
                //                    .fontWeight(.black)
                //                    .foregroundStyle(Color("Gold-BC"))
                //                    .padding()
                //                    .background(Color("Maroon-BC"))
                //                    .cornerRadius(15)
                
                Spacer()
                
                Image(systemName: "speaker.wave.3", variableValue: 0.68)
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.multicolor)
                    .padding()
                    .background(Color(hue: 0.502, saturation: 0.289, brightness: 0.966))
                    .cornerRadius(30)
                    .shadow(color: .gray, radius: 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.teal, lineWidth: 2)
                    )
                    .padding()
                                   
                Text(messageString)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.pink)
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                
                Spacer()
                
                Rectangle()
                    .fill(.maroonBC)
                    .frame(width: geometry.size.width * (2/3), height: 1)
                
                HStack {
                    Button("Awesome") {
                        // This is the action preformed when the button is pressed
                        messageString = "You Are Awesome!"
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                    
                    Button("Great") {
                        messageString = "You Are Great!"
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .foregroundStyle(Color("Gold-BC"))
                .fontWeight(.heavy)
                .tint(Color("Maroon-BC"))
            }
        }
        
    }
}

#Preview {
    ContentView()
}
