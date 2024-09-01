//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theodore Utomo on 8/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    var body: some View {
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
                .foregroundStyle(.indigo)
                .italic()
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
        }
    }
}

#Preview {
    ContentView()
}
