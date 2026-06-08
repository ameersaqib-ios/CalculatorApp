//
//  DisplaySection.swift
//  CalculatorApp
//
//  Created by Meer on 08/06/2026.
//

import SwiftUI

struct DisplaySection: View {
    let displayValue: String
    var body: some View {
        HStack {
            Spacer()
            Text(displayValue)
                .font(.system(size: 72, weight: .thin))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .padding(.horizontal, 16)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}
