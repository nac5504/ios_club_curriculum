
// LOOPS

let names = ["Anna", "Alex", "Brian", "Jack"]

// For-in loops
for name in names {
    print("Hello, \(name)!")
}

// For-in with dictionaries -> (key, value)
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// For-in with ranges.
for index in 1...5 {
    print("\(index) times 5 is \(index*5)")
}

/*
 Some types of Range:
 1...n <==> Closed Range [1, n]
 1..<n <==> Half-Open Range [1, n)
 1... <==> Open Range, inclusive (can be used in array indexing)
 ...n <==> Open Range (can be used in array indexing)
 */

let hours = 12
let hourInterval = 3

// For-in with stride function.
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // Creates a range of numbers from 3 to 12 (hourInterval) with a spacing of 3 (hours) -> [3, 6, 9, 12].
    print(tickMark)
}

