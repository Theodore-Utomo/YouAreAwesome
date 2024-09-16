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
    @State private var soundIsOn = true
    
    var body: some View {
        
        
        
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
                    .animation(.easeInOut(duration: 0.15), value: messageString)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .gray, radius: 50)
                    .padding()
                    .animation(.easeInOut(duration: 0.15), value: messageString)
                
                
                
                Spacer()
                
                Rectangle()
                    .fill(.maroonBC)
                    .frame(width: geometry.size.width * (3/4), height: 1)
                
                HStack {
                    Text("Sound On: ")
                    Toggle("", isOn: $soundIsOn)
                        .labelsHidden()
                        .onChange(of: soundIsOn) {
                            if audioPlayer != nil && audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }

                        }

                    Spacer()
                    
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
                        
                        if soundIsOn {
                            playSound(soundName: soundName)
                        }
                        
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding()
                .foregroundStyle(Color("Gold-BC"))
                .fontWeight(.heavy)
                .tint(.accentColor)
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
