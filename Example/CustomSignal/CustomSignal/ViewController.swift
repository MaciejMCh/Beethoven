//
//  ViewController.swift
//  CustomSignal
//
//  Created by Maciej Chmielewski on 04.09.2017.
//  Copyright © 2017 Maciej Chmielewski. All rights reserved.
//

import Cocoa
import Beethoven
import Pitchy
import AVFoundation

class ViewController: NSViewController, PitchEngineDelegate {
    var pitchEngine: PitchEngine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frequencies = try? [
          391.995435981749,
          391.995435981749,
          415.304697579945,
          Note(letter: Note.Letter.A, octave: 4).frequency,
          466.163761518090,
          466.163761518090,
          Note(letter: Note.Letter.A, octave: 4).frequency,
          415.304697579945,
          391.995435981749
        ]
        
        let config = Config(bufferSize: AVAudioFrameCount(1024), estimationStrategy: .yin, audioUrl: nil)
        let signalTracker = SimulatorSignalTracker(frequencies: frequencies, delayMs: 1000)
        let pitchEngine = PitchEngine(config: config, signalTracker: signalTracker, delegate: self)
        pitchEngine.start()
        
        self.pitchEngine = pitchEngine
    }
    
    func pitchEngineDidReceivePitch(_ pitchEngine: PitchEngine, pitch: Pitch) {
        debugPrint(pitch.frequency)
    }
    
    func pitchEngineDidReceiveError(_ pitchEngine: PitchEngine, error: Error) {
        debugPrint(error)
    }
    
    func pitchEngineWentBelowLevelThreshold(_ pitchEngine: PitchEngine) {
        debugPrint("treshold")
    }
}

