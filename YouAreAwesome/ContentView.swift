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
                        let message1 = "You Are Awesome!"
                        let message2 = "You Are Great!"
                        let image0 = "image0"
                        let image1 = "image1"
                        // This is the action preformed when the button is pressed
                        messageString = (messageString == message1 ? message2 : message1)
                        imageName = (messageString == message1 ? image1 : image0)
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
