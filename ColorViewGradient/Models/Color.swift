//
//  Color.swift
//  ColorViewGradient
//
//  Created by Dmitry Parhomenko on 17.03.2024.
//

import Foundation

struct Color {
    let redValue: Float
    let greenValue: Float
    let blueValue: Float
    
    static func getColor() -> Color {
        Color(
            redValue: 0.1,
            greenValue: 0.5,
            blueValue: 0.9
        )
    }
}
