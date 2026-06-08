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

            VStack(spacing: 12) {
                DisplaySection(displayValue: viewModel.displayValue)
                ButtonGridSection(buttonRows: viewModel.buttonRows ,buttonTapped: viewModel.buttonTapped)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
    }
}
