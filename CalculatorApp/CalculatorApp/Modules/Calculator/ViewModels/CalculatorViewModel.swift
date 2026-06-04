//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import Foundation
import SwiftUI

@Observable
final class CalculatorViewModel {

    private(set) var displayValue: String = "0"

    private var firstOperand: Decimal?
    private var pendingOperation: CalculatorOperation?
    private var shouldResetDisplay = false

    // MARK: - Button Tap Entry Point

    func buttonTapped(_ button: CalculatorButton) {
        switch button {
        case .digit(let number):   handleDigit(number)
        case .decimal:             handleDecimal()
        case .operation(let op):   handleOperation(op)
        case .equals:              handleEquals()
        case .clear:               handleClear()
        case .delete:              handleDelete()
        case .toggleSign:          handleToggleSign()
        case .percentage:          handlePercentage()
        }
    }

    // MARK: - Private Handlers (each does ONE thing)

    private func handleDigit(_ number: Int) {
        if shouldResetDisplay {
            displayValue = "\(number)"
            shouldResetDisplay = false
        } else {
            displayValue = displayValue == "0"
                ? "\(number)"
                : displayValue + "\(number)"
        }
    }

    private func handleDecimal() {
        if shouldResetDisplay {
            displayValue = "0."
            shouldResetDisplay = false
            return
        }
        if !displayValue.contains(".") {
            displayValue += "."
        }
    }

    private func handleOperation(_ operation: CalculatorOperation) {
        if firstOperand != nil && !shouldResetDisplay {
            handleEquals()
        }
        firstOperand = Decimal(string: displayValue)
        pendingOperation = operation
        shouldResetDisplay = true
    }

    private func handleEquals() {
        guard
            let first = firstOperand,
            let operation = pendingOperation,
            let second = Decimal(string: displayValue)
        else { return }

        let result = calculate(first, operation, second)
        displayValue = formatResult(result)
        firstOperand = nil
        pendingOperation = nil
        shouldResetDisplay = true
    }

    private func handleClear() {
        displayValue = "0"
        firstOperand = nil
        pendingOperation = nil
        shouldResetDisplay = false
    }

    private func handleDelete() {
        guard displayValue.count > 1 else {
            displayValue = "0"
            return
        }
        displayValue.removeLast()
    }

    private func handleToggleSign() {
        guard var value = Decimal(string: displayValue) else { return }
        value.negate()
        displayValue = formatResult(value)
    }

    private func handlePercentage() {
        guard let value = Decimal(string: displayValue) else { return }
        displayValue = formatResult(value / 100)
    }

    // MARK: - Pure Math (no UI, no state — pure calculation)

    private func calculate(
        _ first: Decimal,
        _ operation: CalculatorOperation,
        _ second: Decimal
    ) -> Decimal {
        switch operation {
        case .add:      return first + second
        case .subtract: return first - second
        case .multiply: return first * second
        case .divide:
            guard second != 0 else { return .nan }
            return first / second
        }
    }

    private func formatResult(_ value: Decimal) -> String {
        if value.isNaN { return "Error" }
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 10
        formatter.minimumFractionDigits = 0
        return formatter.string(for: value) ?? "Error"
    }
}
