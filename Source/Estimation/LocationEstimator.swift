protocol LocationEstimator: Estimator {
  func estimateLocation(buffer: Buffer) throws -> Int
}

extension LocationEstimator {
  
  // MARK: - Default implementation
  
  public var transformer: Transformer {
    return FFTTransformer()
  }
  
  public func estimateFrequency(sampleRate: Float, buffer: Buffer) throws -> Float {
    let location = try estimateLocation(buffer: buffer)
    return estimateFrequency(sampleRate: sampleRate, location: location, bufferCount: buffer.count)
  }
}

