
// Protocol: If you know Java, protocols function very similarly to Interfaces. Formally it's a "blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality." Structs and classes can both implement protocols, look at the below examples to understand their use cases and different syntax nuances:

protocol Shape {
    var area: Double { get } // This protocol only has one rule, any struct/class that implements it must contain an 'area' variable of type Double.
}

// We indicate that this Point implements from the Shape protocol:
struct Point: Shape {
    let area: Double = 0
}

struct Triangle: Shape {
    let sideA: Double
    let sideB: Double
    
    // If you're put off by this syntax below, it's called a 'computed property' -> a variable that computes a value the moment we call it (similar to a function, but MUCH more concise). It is also more efficient as it doesn't recompute from scratch if the associated values remain the same (sideA and sideB in this case).
    var area: Double {
        sideA * sideB * 0.5
    }
}

struct Circle: Shape {
    let radius: Double
    
    var area: Double {
        pow(radius, 2) * .pi
    }
}

func drawShape(shape: Shape) { // The input can be anything that implements from the Shape protocol.
    print("area of drawable shape: \(shape.area)")
}

drawShape(shape: Circle(radius: 2))

struct Person {
    var name: String
    var age: Int
}

// Don't worry much about extensions for now, just know that we use it to add more functionality to existing structs.
extension Person: Equatable { // The built-in Equatable protocol is one of the more important protocols in Swift, allowing us to define what '==' means when used between two Persons.
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

// Hashable is another important protocol. This allows us to define how two objects have the same hash value. Here we look at name and age to determine the hash value for this.
extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.age)
    }
}

struct MyStringPair {
    let first: String
    let second: String
}

struct MyIntPair {
    let first: Int
    let second: Int
}

struct MyDoublePair {
    let first: Double
    let second: Double
}

struct MyShapePair {
    let first: Shape
    let second: Shape
}

struct MyStringPairPair {
    let first: MyStringPair
    let second: MyStringPair
}

// What about a String, Int pair???
// For 5 types, we can have 10 different structs!!!

// INSTEAD:
// This is just a function that takes two types and returns a type.
// The parameters are called type parameters. Also known as Generics.
struct Pair<First, Second> {
    let first: First
    let second: Second
}

// Pair<String, String>    ==> MyStringPair
// Pair<Int, Int>          ==> MyIntPair
// Pair<Int, String>       ==> MyIntStringPair
// Pair<Circle, Triangle>  ==> MyCircleTrianglePair

extension Pair: Shape where First: Shape, Second: Shape {
    
    // We're giving the Pair struct a new local variable. ONLY if (per the syntax above) First is of type Shape and Second is of type Shape.
    
    var area: Double {
        return first.area + second.area
    }
}

let shapePair: Pair<Circle, Triangle> = Pair(first: Circle(radius: 5), second: Triangle(sideA: 10, sideB: 10))
print(shapePair.area)

protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    
    var count: Int { get }
    func item(at: Int) -> Item?
}

struct IntStack: Container {
    typealias Item = Int
    
    private var stack: [Int] = []
    
    var count: Int {
        return stack.count
    }
    
    func item(at idx: Int) -> Int? {
        stack[idx]
    }
    
    mutating func add(_ item: Int) {
        stack.append(item)
    }
}

struct StringPair: Container {
    typealias Item = String
    
    let first: String
    let second: String
    
    var count: Int {
        return 2
    }
    
    mutating func add(_ item: String) {
        // nothing here
    }
    
    func item(at idx: Int) -> String? {
        if idx == 1 {
            return first
        } else if idx == 2 {
            return second
        }
        return nil
    }
    
}

// ❌❌❌ What should the return value be? String? Int?
// func getFirstItem(in container: Container) -> ??? {
//
// }

func getGenericFirstItem<C: Container>(in container: C) -> C.Item? {
    return container.item(at: 0)
}

var intStack = IntStack()
intStack.add(1)
let stringPair = StringPair(first: "iOS", second: "Club")

// Int
print(getGenericFirstItem(in: intStack) ?? "None") // Wondering why we have a '??' following the value? Continue to the next files.
// String
print(getGenericFirstItem(in: stringPair) ?? "None")
