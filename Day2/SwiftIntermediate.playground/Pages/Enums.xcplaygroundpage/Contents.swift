enum GameState {
    //               We can give cases inputs as well!
    case initializing, playing(String), lost
    
    // You can thing of this variable as a way of assigning these cases 'properties'. All very useful when we want to manage a lot of constants.
    var asString: String {
        switch self {
        case .lost:
            return "Losing is in progress, please wait."
        case .playing(let someString):
            return "Playing is in progress, please wait." + someString
        case .initializing:
            return "Loading is in progress, please wait."
            
        }
    }
}

// We can call on these specific cases and their properties in the following manner:
var myGameState: String = GameState.playing(" Hi.").asString
var someGameState: String = GameState.initializing.asString

// Playing game state:
print(myGameState)
