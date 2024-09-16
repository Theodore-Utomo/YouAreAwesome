//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theodore Utomo on 8/31/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
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
                
                Text(messageString)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.maroonBC)
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .gray, radius: 50)
                    .padding()
                
                
                
                Spacer()
                
                Rectangle()
                    .fill(.maroonBC)
                    .frame(width: geometry.size.width * (3/4), height: 1)
                
                HStack {
                    Button("Show Message") {
                        // This is the action preformed when the button is pressed
                        let messages = ["You Are Awesome!",
                                        "You Are Great!",
                                        "Keep Up The Good Work!",
                                        "Fabulous? That's You!",
                                        "People Wish They Could Be You!"]
                        
                        lastMessageNumber = nonRepeatingRandom(numOfMembers: messages.count - 1, lastNumber: lastMessageNumber)
                        messageString = messages[lastMessageNumber]
                        
                        lastImageNumber = nonRepeatingRandom(numOfMembers: 2, lastNumber: lastImageNumber)
                        imageName = "image\(lastImageNumber)"
                        
                        var soundName: String
                        lastSoundNumber = nonRepeatingRandom(numOfMembers: 5, lastNumber: lastSoundNumber)
                        soundName = "sound\(lastSoundNumber)"
                        

                        playSound(soundName: soundName)
                        
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
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
    
    func nonRepeatingRandom(numOfMembers: Int, lastNumber: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...numOfMembers)
        } while newNumber == lastNumber
        return newNumber
    }
}

#Preview {
    ContentView()
}
