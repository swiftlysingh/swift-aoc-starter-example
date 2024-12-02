import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entitiesLeft: [Int] {
    data
      .split(separator: "\n") // Split lines
      .compactMap { line in
        line.split(separator: " ", omittingEmptySubsequences: true).first // Take the left part
      }
      .compactMap { Int($0) }
      .sorted() // Convert to Int
  }

  // Computed property for right entities

  var entitiesRight: [Int] {
    data
      .split(separator: "\n") // Split lines
      .compactMap { line in
        line.split(separator: " ", omittingEmptySubsequences: true).last // Take the right part
      }
      .compactMap { Int($0) }
      .sorted() // Convert to Int
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var answer = 0

    for (left, right) in zip(entitiesLeft, entitiesRight) {
      answer = answer + abs(left - right)
    }

    return answer
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
//    entities.map { $0.max() ?? 0 }.reduce(0, +)
    var answer = 0
    for left in entitiesLeft {
      let count = similarityCount(leftNum: left)
      answer = answer + count * left
    }
    return answer
  }

  func similarityCount(leftNum: Int) -> Int {
    var count = 0
    for right in entitiesRight {
        if leftNum == right {
          count += 1
        } else if leftNum > right {
          continue
        } else if leftNum < right {
          break
        }
      }
    return count
  }
}
