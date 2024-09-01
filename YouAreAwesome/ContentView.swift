//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theodore Utomo on 8/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "When the Genius Bar needs help, they call you!"
    var body: some View {
        VStack {
            
        }
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.mint)
                .padding(.horizontal, 30.0)
                .padding(.bottom, 100.0)
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.indigo)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .border(.orange, width: 1)
                .padding()
            HStack {
                Button("Awesome") {
                    // This is the action preformed when the button is pressed
                    messageString = "You Are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                
                Button("Great") {
                    messageString = "You Are Great!"
                }
                .buttonStyle(.borderedProminent)
            }
            .border(.purple, width: 3)
        }
    }
}

#Preview {
    ContentView()
}
