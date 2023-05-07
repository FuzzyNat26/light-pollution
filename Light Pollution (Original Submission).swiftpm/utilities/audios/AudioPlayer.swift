//
//  AudioPlayer.swift
//  
//
//  Created by Jonathan Lee on 16/04/23.
//

import Foundation
import AVFoundation

class AudioPlayer {
    var audioPlayer: AVAudioPlayer?
    
    static let shared: AudioPlayer = AudioPlayer.init()
 
    func playSoundFromPath(name: String, type: String, loop: Bool = false) {
        if let path = Bundle.main.path(forResource: name, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = loop ? -1 : 0
                audioPlayer?.play()
            } catch let error {
                print("Sound Play Error.lDescription -> \(error.localizedDescription)")
                print("Sound Play Error -> \(error)")
            }
        }
    }
}
