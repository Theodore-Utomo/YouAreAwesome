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
                        var newMessageNumber: Int
                        repeat {
                            newMessageNumber = Int.random(in: 0 ... (messages.count - 1))
                            messageString = messages[newMessageNumber]
                        } while newMessageNumber == lastMessageNumber
                        lastMessageNumber = newMessageNumber
                        
                        var newImageNumber: Int
                        repeat {
                            newImageNumber = Int.random(in: 0...2)
                            imageName = "image\(newImageNumber)"
                        } while newImageNumber == lastImageNumber
                        lastImageNumber = newImageNumber
                        
                        var soundName: String
                        var newSoundNumber: Int
                        repeat {
                            newSoundNumber = Int.random(in: 0...5)
                            soundName = "sound\(newSoundNumber)"
                        } while newSoundNumber == lastSoundNumber
                        lastSoundNumber = newSoundNumber
                        
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
