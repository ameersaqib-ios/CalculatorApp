//
//  CalculatorButtonView.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import SwiftUI

import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(button.displayTitle)
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(button.backgroundColor)
                .clipShape(Circle())
        }
        .buttonStyle(CalculatorButtonStyle())
    }
}

struct CalculatorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.92 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

