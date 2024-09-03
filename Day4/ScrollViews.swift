//
//  ScrollViews.swift
//  SwiftUI_Day4
//
//  Created by Abdulaziz Albahar on 2/22/23.
//

import SwiftUI

enum Countries: String, CaseIterable, Identifiable {
    
    case USA = "USA"
    case UK = "UK"
    case Italy = "Italy"
    case Spain = "Spain"
    case France = "France"
    
    var id: String { UUID().uuidString }
    
    var color: Color {
        switch self {
        case .USA:
            return Color(UIColor.red)
        case .UK:
            return Color(UIColor.blue)
        case .Italy:
            return Color(UIColor.green)
        case .Spain:
            return Color(UIColor.orange)
        case .France:
            return Color(UIColor.systemBlue)
        }
    }
    
}

struct ScrollViews: View {
        
    let COUNTRIES: [Countries] = Countries.allCases // Initialized an array containing all the possible countries.
    
    var body: some View {
        
        
        VStack {
            
            // One of many ways to set font
            Text("Scroll View").font(Font.system(
                size: 30,
                weight: Font.Weight.bold,
                design: Font.Design.rounded)
            )
            
            Divider().overlay(content: { Color.black })

            ScrollView {
                ForEach(COUNTRIES) { country in
                    
                    let color = country.color
                    let country = country.rawValue
                    
                    Text(country).foregroundColor(color).padding([.bottom, .horizontal], 10)
                     
                     
                    
                }
            }
            
            Divider().overlay(content: { Color.black })

        }
        
         .frame(height: 200)
        
        
        
        
    }
}

struct ScrollViews_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViews()
    }
}
