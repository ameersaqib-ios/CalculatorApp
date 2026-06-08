//
//  ButtonGridSection.swift
//  CalculatorApp
//
//  Created by Meer on 08/06/2026.
//

import SwiftUI

struct ButtonGridSection: View {
    let buttonRows: [[CalculatorButton]]
    let buttonTapped: (CalculatorButton) -> Void
    var body: some View {
        VStack(spacing: 12) {
            ForEach(buttonRows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(button: button) {
                            buttonTapped(button)
                        }
                        .frame(height: buttonSize)
                    }
                }
            }
        }
    }
    private var buttonSize: CGFloat {
        (UIScreen.main.bounds.width - 64) / 4
    }
}
