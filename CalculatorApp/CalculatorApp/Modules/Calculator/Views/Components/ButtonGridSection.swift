//
//  ButtonGridSection.swift
//  CalculatorApp
//
//  Created by Meer on 08/06/2026.
//

import SwiftUI

struct ButtonGridSection: View {
    let buttonRows: [[CalculatorButton]]
    let activeOperation: CalculatorOperation?
    let clearButtonTitle: String
    let buttonTapped: (CalculatorButton) -> Void

    private var buttonSize: CGFloat {
        (UIScreen.main.bounds.width - 32 - 36) / 4
    }

    var body: some View {
        VStack(spacing: 12) {
            ForEach(buttonRows.dropLast(), id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(
                            button: button,
                            title: titleOverride(for: button),
                            isActive: isActive(button),
                            onTap: { buttonTapped(button) }
                        )
                        .frame(width: buttonSize, height: buttonSize)
                    }
                }
            }

            LastRowView(
                activeOperation: activeOperation,
                clearButtonTitle: clearButtonTitle,
                buttonSize: buttonSize,
                buttonTapped: buttonTapped
            )
        }
    }

    private func isActive(_ button: CalculatorButton) -> Bool {
        guard case .operation(let op) = button else { return false }
        return op == activeOperation
    }

    private func titleOverride(for button: CalculatorButton) -> String? {
        if case .clear = button { return clearButtonTitle }
        return nil
    }
}
