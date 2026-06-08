//
//  CalculatorButtonStyle.swift
//  CalculatorApp
//
//  Created by Meer on 08/06/2026.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.92 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
