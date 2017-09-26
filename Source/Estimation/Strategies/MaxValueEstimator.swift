public struct MaxValueEstimator: LocationEstimator {
  public init() {}
  func estimateLocation(buffer: Buffer) throws -> Int {
    return try maxBufferIndex(from: buffer.elements)
  }
}

