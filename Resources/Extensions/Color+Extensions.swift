//
//  Color+Extensions.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import SwiftUI

extension Color {
    init(hex: String) {
        
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines) //removes spaces
        
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        
        var rgb: UInt64 = 0 //Hex colors are stored as numbers,converted into one big number,That's what UInt64 stores.
        
        Scanner(string: hex).scanHexInt64(&rgb) //converts it into numeric value
        
        let red = Double((rgb >> 16) & 0xFF) / 255 // >> means bit shifting
        let green = Double((rgb >> 8) & 0xFF) / 255
        let blue = Double(rgb & 0xFF) / 255
        
        self.init(red: red, green: green, blue: blue) // create a Color using these red,blue,and green values
    }
}
