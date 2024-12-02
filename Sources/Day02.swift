import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    
    var count = 0
    for array in entities {
      if checkSafety(for: array) {
        count += 1
      }
    }
    return count
  }
  
  func checkSafety(for array: [Int]) -> Bool {
    if array.count < 2 {
      return false
    }
    let decreasing = array[1] < array[0]
    
    for i in 0..<array.count-1 {
      
      let diff = array[i] - array[i + 1]
      
      if decreasing && diff > 0 && diff <= 3 {
        continue
      } else if !decreasing && diff < 0 && diff >= -3 {
        continue
      } else {
        return false
      }
    }
    return true
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    var count = 0
    for array in entities {
      if checkSafetyWithDamper(for: array) {
        count += 1
      }
    }
    return count
  }
  
  func checkSafetyWithDamper(for array: [Int]) -> Bool {
    if array.count < 2 {
      return false
    }
    
    
    for i in 0..<array.count {
      if checkSafety(for: removeElement(from: array, at: i)) {
        return true
      }
      
    }
    
    return false
  }
  
  func removeElement<T>(from array: [T], at index: Int) -> [T] {
    var modifiedArray = array
    if index >= 0 && index < modifiedArray.count {
      modifiedArray.remove(at: index)
    }
    return modifiedArray
  }
  
}
