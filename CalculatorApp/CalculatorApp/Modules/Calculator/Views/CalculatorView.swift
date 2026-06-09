//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import SwiftUI

struct CalculatorView: View {
    @State private var viewModel = CalculatorViewModel()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                DisplaySection(displayValue: viewModel.displayValue)
                    .padding(.bottom, 12)

                ButtonGridSection(
                    buttonRows: viewModel.buttonRows,
                    activeOperation: viewModel.activeOperation,
                    clearButtonTitle: viewModel.clearButtonTitle,
                    buttonTapped: viewModel.buttonTapped
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
    }
}
