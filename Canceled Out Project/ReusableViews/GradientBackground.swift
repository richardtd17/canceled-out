//
//  GradientBackground.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/3/23.
//

import SwiftUI

struct GradientBackground: View {
    
    var startColor: Color = lightAccentColor
    var endColor: Color = primaryColor
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [startColor, endColor]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)  // Ignore safe area to extend the gradient to the edges
    }
}
