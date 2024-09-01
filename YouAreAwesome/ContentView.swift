//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theodore Utomo on 8/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.mint)
                .padding(.horizontal, 30.0)
                .padding(.bottom, 100.0)
            Text("You Are Awesome!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.indigo)
                .italic()
        }
    }
}

#Preview {
    ContentView()
}
