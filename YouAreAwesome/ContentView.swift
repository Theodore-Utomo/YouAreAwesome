//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theodore Utomo on 8/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
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
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .gray, radius: 50)
                    .padding()
                
                Text(messageString)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.maroonBC)
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                
                Spacer()
                
                Rectangle()
                    .fill(.maroonBC)
                    .frame(width: geometry.size.width * (3/4), height: 1)
                
                HStack {
                    Button("Show Message") {
                        // This is the action preformed when the button is pressed
                        var messages = ["You Are Awesome!",
                                        "You Are Great!",
                                        "Keep Up The Good Work!",
                                        "Fabulous? That's You!",
                                        "People Wish They Could Be You!"]
                        
                        messageString = messages[messageNumber]
                        messageNumber += 1
                        if messageNumber > messages.count - 1{
                            messageNumber = 0
                        }
                        imageName = "image\(imageNumber)"
                        imageNumber += 1
                        if imageNumber > 2 {
                            imageNumber = 0
                        }
                        
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
