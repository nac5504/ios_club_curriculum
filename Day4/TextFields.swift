//
//  ContentView.swift
//  SwiftUI_Day4
//
//  Created by Abdulaziz Albahar on 2/22/23.
//

import SwiftUI

struct TextFields: View {
    
    @State var name: String = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            // Can enable more customization with this variation of the font method.
            Text("Text Fields").font(Font.system(
                size: 30,
                weight: Font.Weight.bold,
                design: Font.Design.rounded)
            )
            
            
            TextField("Name", text: $name) // Dollar sign lets you access the name as a state variable.
            
            
            // With styling:
            
            // With .frame(), we have changed the amount of space the view takes up inside its parent view. Built-in styling has also been applied.
            TextField("Name", text: $name).frame(width: 100, height: 40).textFieldStyle(.roundedBorder)
            
            // Can also do this for same behavior (more customizable):
            
            TextField("Name", text: $name).padding(.leading, 5).frame(width: 100, height: 40).overlay(content: {
                
                RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1)
                
            })            
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}
