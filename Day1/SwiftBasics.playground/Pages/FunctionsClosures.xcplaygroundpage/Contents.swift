

// Creating a function:
func sayHello(name: String, anotherPerson: String) -> String {
    return "Hello \(name), and \(anotherPerson)" // Same as return"Hello " + name + "and " + anotherPerson.
}

func sayGoodbye(name: String, anotherPerson: String) -> String {
    return "Goodbye \(name), and \(anotherPerson)"
}


print(sayHello(name: "Nick", anotherPerson: "Jack"))

// Functions are types in Swift. The above function's type is (String, String) -> String.
// Since Functions are types, you can assign them to variables.

var helloFunc: (String, String) -> String = sayGoodbye
print(helloFunc("John", "Mark"))

/*
 We can specify alternative parameter names for when functions are called. This is simply a design choice for more readable and context-driven code.
 It's a matter of convenience.
 Let's look at the first String parameter in anotherSayHello(...), 'to' is the parameter name we chose for function calls, 'person' is the name we chose to refer to in the implementation:
 - To refer to our first String variable from within the function implementation we must use the variable name 'person'.
 - When making them call to this function elsewhere in your code, that same parameter variable will be displayed as 'to'.
 See the examples below to understand more.
 */
func anotherSayHello(to person: String, and aFriend: String) -> String {
    return "Hello \(person), and \(aFriend)"
}

print(anotherSayHello(to: "Noah", and: "Max"))

// Since functions are types and can be assigned to variables, you can also pass them as parameters.
// These become "Closures" as they are called. It's a widely used Swift convention. This is important to understand, as a lot of APIs take in "Closures".

func sayHiAndPerformAnOperation(name: String, operation: (Int) -> Int) -> String {
    return "Hello \(name). The result of your operation(5) is \(operation(5))."
}


/*
 The syntax 'myInt in' is simply the way we instantiate the parameters that we are expecting to receive, which in this case is an integer - look above. 'myInt' seems kind of random, because it is. We can even call this 'myInteger' or 'myInt2'. It doesn't matter.
 */
sayHiAndPerformAnOperation(name: "John", operation: { myInt in
    return myInt + 5
})

// Syntactic Sugar Step 1: Remove 'return' if 1-liner

sayHiAndPerformAnOperation(name: "John", operation: { myInt in
    myInt + 5
})

// Syntactic Sugar Step 2: Remove last parameter name ('operation')

sayHiAndPerformAnOperation(name: "John") { myInt in
    myInt + 5
}

// Syntactic Sugar Step 3: Remove parameter name in closure

sayHiAndPerformAnOperation(name: "John") { $0 + 5 } // Since our function only has one parameter, we can use $0 to refer to it.



