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

