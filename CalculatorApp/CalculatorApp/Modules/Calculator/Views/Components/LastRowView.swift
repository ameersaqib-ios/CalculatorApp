//
//  LastRowView.swift
//  CalculatorApp
//
//  Created by Meer on 09/06/2026.
//

import SwiftUI

struct LastRowView: View {
    let activeOperation: CalculatorOperation?
    let clearButtonTitle: String
    let buttonSize: CGFloat
    let buttonTapped: (CalculatorButton) -> Void

    var body: some View {
        HStack(spacing: 12) {
            wideZeroButton
            CalculatorButtonView(
                button: .decimal,
                isActive: false,
                onTap: { buttonTapped(.decimal) }
            )
            .frame(width: buttonSize, height: buttonSize)

            CalculatorButtonView(
                button: .delete,
                isActive: false,
                onTap: { buttonTapped(.delete) }
            )
            .frame(width: buttonSize, height: buttonSize)

            CalculatorButtonView(
                button: .equals,
                isActive: false,
                onTap: { buttonTapped(.equals) }
            )
            .frame(width: buttonSize, height: buttonSize)
        }
    }

    private var wideZeroButton: some View {
        Button {
            buttonTapped(.digit(0))
        } label: {
            Text("0")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: buttonSize, height: buttonSize)
                .background(Color("ButtonDarkGray"))
                .clipShape(Circle())
        }
        .buttonStyle(CalculatorButtonStyle())
    }
}
