//
//  CustomSignalTracker.swift
//  Beethoven
//
//  Created by Maciej Chmielewski on 04.09.2017.
//

import Foundation
import AVFoundation

public class CustomSignalTracker: SignalTracker {
    
    public var mode: SignalTrackerMode = .record
    
    public var levelThreshold: Float?
    
    public var peakLevel: Float?
    
    public var averageLevel: Float?
    
    public weak var delegate: SignalTrackerDelegate?
    
    private let sampleRate: Double
    private let sampleLength: Int
    private let time: AVAudioTime
    
    public init(sampleRate: Double, sampleLength: Int) {
        self.sampleRate = sampleRate
        self.sampleLength = sampleLength
        time = AVAudioTime(sampleTime: 0, atRate: sampleRate)
    }
    
    open func passSignal(samples: [Float]) {
        delegate?.signalTracker(self, didReceiveBuffer: createPCMBuffer(samples: samples), atTime: time)
    }
    
    public func start() throws {}
    
    public func stop() {}
    
    private func createPCMBuffer(samples: [Float]) -> AVAudioPCMBuffer {
        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: AVAudioFrameCount(sampleLength))!
        
        if let channelData = buffer.floatChannelData {
            for i in 0..<sampleLength {
                channelData[0][i] = samples[i]
            }
            buffer.frameLength = buffer.frameCapacity
        }
        return buffer
    }
}
