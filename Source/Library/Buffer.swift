public struct Buffer {
  
  var elements: [Float]
  var realElements: [Float]?
  var imagElements: [Float]?
  
  var count: Int {
    return elements.count
  }
  
  // MARK: - Initialization
  
  public init(elements: [Float], realElements: [Float]? = nil, imagElements: [Float]? = nil) {
    self.elements = elements
    self.realElements = realElements
    self.imagElements = imagElements
  }
}

