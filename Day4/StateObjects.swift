//
//  StateObjects.swift
//  SwiftUI_Day4
//
//  Created by Abdulaziz Albahar on 2/22/23.
//

import SwiftUI

struct StateObjects: View {
    
    /*
     NOTE: Show with @Binding as well. Go over components without added properties. Explain difference.
     */
    
    
    @StateObject var USA: Country = Country(name: "USA", color: UIColor.red)
    @StateObject var UK: Country = Country(name: "UK", color: UIColor.blue)
    @StateObject var Italy: Country = Country(name: "Italy", color: UIColor.green)
    @StateObject var Spain: Country = Country(name: "Spain", color: UIColor.orange)
    @StateObject var France: Country = Country(name: "France", color: UIColor.systemBlue)

    
    var body: some View {
        
        // Initialized an array containing all the possible countries.
        let COUNTRIES: [Country] = [USA, UK, Italy, Spain, France]
        
        
        VStack {
            
            Text("State Objects").font(Font.system(
                size: 30,
                weight: Font.Weight.bold,
                design: Font.Design.rounded)
            )
            
            Divider().overlay(content: { Color.black })

            ScrollView {
                ForEach(COUNTRIES) { country in
                    
                    let color = country.color
                    let name = country.name
                    
                    Button(action: {
                        country.changeColor()
                    }, label: {
                        
                        Text(name)
                            .frame(width: 200, height: 100)
                            .foregroundColor(color)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 5)
                                            .stroke(color, lineWidth: 1)
                            })
                            

                    }).padding([.bottom, .horizontal], 20)
                     
    
                    
                }
            }
            
            Divider().overlay(content: { Color.black })

        }
        .frame(width: 300, height: 500)
        
        
        
        
    }

}

struct StateObjects_Previews: PreviewProvider {
    static var previews: some View {
        StateObjects()
    }
}
