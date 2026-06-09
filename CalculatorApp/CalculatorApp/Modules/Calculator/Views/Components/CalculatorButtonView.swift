//
//  CalculatorButtonView.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    var title: String? = nil
    let isActive: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(title ?? button.displayTitle)
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(isActive ? Color("ButtonOrange") : .white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(buttonBackground)
                .clipShape(Circle())
        }
        .buttonStyle(CalculatorButtonStyle())
    }

    private var buttonBackground: Color {
        if isActive { return .white }
        switch button {
        case .operation, .equals:
            return Color("ButtonOrange")
        case .clear, .delete, .toggleSign, .percentage:
            return Color("ButtonGray")
        default:
            return Color("ButtonDarkGray")
        }
    }
}

