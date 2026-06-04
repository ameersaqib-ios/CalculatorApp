//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import SwiftUI

struct CalculatorView: View {
    @State private var viewModel = CalculatorViewModel()

    private let buttonRows: [[CalculatorButton]] = [
        [.clear, .toggleSign, .percentage, .operation(.divide)],
        [.digit(7), .digit(8), .digit(9), .operation(.multiply)],
        [.digit(4), .digit(5), .digit(6), .operation(.subtract)],
        [.digit(1), .digit(2), .digit(3), .operation(.add)],
        [.digit(0), .decimal, .delete, .equals]
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 12) {
                displaySection
                buttonGridSection
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
    }

    private var displaySection: some View {
        HStack {
            Spacer()
            Text(viewModel.displayValue)
                .font(.system(size: 72, weight: .thin))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .padding(.horizontal, 16)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }

    private var buttonGridSection: some View {
        VStack(spacing: 12) {
            ForEach(buttonRows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(button: button) {
                            viewModel.buttonTapped(button)
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
