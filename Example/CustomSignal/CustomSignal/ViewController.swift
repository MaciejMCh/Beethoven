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
        
        let frameLength = 1024
        let sampleRate = 8000.0
        
        let config = Config(bufferSize: AVAudioFrameCount(frameLength), estimationStrategy: .yin, audioUrl: nil)
        let signalTracker = CustomSignalTracker(sampleRate: sampleRate, sampleLength: frameLength)
        let pitchEngine = PitchEngine(config: config, signalTracker: signalTracker, delegate: self)
        pitchEngine.start()
        
        var signal: [Float] = Array(repeating: 0, count: frameLength)
        for i in 0..<frameLength {
            let sample: Float32 = sin(0.2 * Float32(i))
            signal[i] = sample
        }
        signalTracker.passSignal(samples: signal)
        signalTracker.passSignal(samples: signal)
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
