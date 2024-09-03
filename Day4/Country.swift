//
//  Country.swift
//  SwiftUI_Day4
//
//  Created by Abdulaziz Albahar on 2/22/23.
//

import Foundation
import SwiftUI


class Country: ObservableObject, Identifiable {
    
    @Published var name: String
    @Published var color: Color
    
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = Color(color)
    }
    
    func changeColor() {
        
        let colors: [Color] = [Color(.green), Color(.black), Color(.red), Color(.orange), Color(.gray), Color(.brown)]
        
        self.color = colors.randomElement()!
        
        let optionalString: String? = "a string"
        
        func takesInString(string: String) {
            print("hi im a " + string)
        }
        
        takesInString(string: optionalString ?? "no string")
        
        
    }
    
    
    
    
}
