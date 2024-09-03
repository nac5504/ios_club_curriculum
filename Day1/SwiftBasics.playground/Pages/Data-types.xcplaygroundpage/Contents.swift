/**
 BASIC DATA TYPES: You should know most of these, however note the following:
 
 - Use the explicit type notation as we've done below to make your variables more readable and avoid type errors later on. A lot of benefits to this.
 - Feel free to uncomment the print statements and play with the values of the different variables, in the case that you have any doubts.
 - Note how we label the indicate variable types.
 **/

var someString: String = "car"
// UNCOMMENT:
//print("someString = \(someString)")

var someBool: Bool = false
// UNCOMMENT:
//print("someBool = \(someBool)")

var someInt: Int = 13
// UNCOMMENT:
//print("someInt = \(someInt)")

var someDouble: Double = 13.5
// UNCOMMENT:
//print("someDouble = \(someDouble)")

var someArrayOfStrings: [String] = ["Aziz", "Max", "a string"] // [String] means an array of Strings.
// UNCOMMENT:
//print("someArrayOfStrings = \(someArrayOfStrings)")

var someDictionary: [String : Int] = ["Aziz" : 200, "Max" : 200] // [String : Int] means a dictionary/hashmap of String keys mapped to Int values.
// UNCOMMENT:
//print("someDictionary = \(someDictionary)")

let MY_AGE_CONSTANT: Int = 20
// UNCOMMENT:
//print("MY_AGE_CONSTANT is \(MY_AGE_CONSTANT)")

// EXPLICIT vs. IMPLICIT Declarations:

var helloString = "Hello, Swift@" // Inferred that this is a string. Same as var hello: String = "" .
var anInteger = 10 // Inferred that this is an Int.
var aDoubleOrFloat = 10.0 // Swift will infer this to be a Double by default.

var moreStrings = ["A", "String", "Of", "Words"] // Inferred as [String] or an array of strings.

// MARK: var anArrayOfWhat = [] -> This DOES NOT work. Swift does not know what the type of anArray should be
var correctEmptyStringArrayDeclaration = [String]() // This syntax simply constructs an empty array of strings, no one really uses this.
var anotherCorrectEmptyStringArrayDeclaration: [String] = [] // This does the same thing, in a more readable manner.



