
/*
 OPTIONALS: Every single Type on Swift has an "optional" variation. This is usually used as safeguard for in case the variable gets passed nil (remember what nil is?). This Swift feature guarantees that we always end up with some value instead of an Error that stops our whole application . However, nil may cause an error in runtime if handled innappropriately! We'll see how. Let's have a look at what we mean:
 */

let optionalString: String? // The optional String type can be denoted by a '?' to the right of the type we want.

optionalString = "Nick"
// Operations on Optional Types -> if we want to call a property/function that is associated with the optional variable, we have to call it with an '?' beside it or do something we call 'optional unwrapping' - we'll get to that in a bit. See below:

print(optionalString?.count)


//func returnString() -> String {
//    return "I'm " + optionalString // Notice the red error marker? This is invalid!! This can be fixed via a few of several optional unwrapping methods.
//}

// We can solve/unwrap this in two basic ways: (there are many other ways, but those are too complicated for now)

// 1. Via FORCED UNWRAPPING

func returnStringUnwrapped() -> String {
    return "I'm " + optionalString! // The '!' force unwraps our optional variable, under the impression that it doesn't contain nil, if optionalString = nil, then the application will output an error and stop execution, because we assumed optionalString had a real (non-nil) value.
}

// 2. Via COALESCENT

func returnStringCoalescent() -> String {
    return "I'm " + (optionalString ?? "John Smith") // The ?? is called a 'coalescent', it does the following: returns the value to the right hand side of the variable IF the variable contains nil, else it simply returns the value of the variable. Almost like a safety value.
}

// 3. ... more

print(returnStringCoalescent())

// A variable X of type 'String?' CAN'T be assigned to a variable Y of type 'String' unless we unwrap X in one of the aforementioned manners.

// Alternative ways of presenting a datatype as an optional:
var int0: Int? = Optional(2)
var int1: Optional<Int>

// BONUS: Optional unwrapping via 'if let' unwrap. Don't be put off by the syntax. 'if let X = Y {...}' translates to 'If Y is not nil, assign X to the variable Y as a non-optional type, then perform whatever's inside the brackets using our new X. If Y is nil, move on to the else statement.'
if let someInt = int0 {
    print("Variable someInt is nt nil! We can now use it for any logical process.")
    print("I'm \(someInt) years old.")
} else {
    print("Unable to unwrap int0 because it was nil!")
}

var anotherInt: Int = int0! // We unwrap the passed in optional variable.




