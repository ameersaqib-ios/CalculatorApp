//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import Foundation

@Observable
final class CalculatorViewModel {

    private(set) var activeOperation: CalculatorOperation? = nil
    private(set) var displayValue: String = "0"

    private var firstOperand: Decimal?
    private var pendingOperation: CalculatorOperation?
    private var shouldResetDisplay = false

    let buttonRows: [[CalculatorButton]] = [
        [.clear, .toggleSign, .percentage, .operation(.divide)],
        [.digit(7), .digit(8), .digit(9), .operation(.multiply)],
        [.digit(4), .digit(5), .digit(6), .operation(.subtract)],
        [.digit(1), .digit(2), .digit(3), .operation(.add)],
        [.digit(0), .decimal, .delete, .equals]
    ]

    var clearButtonTitle: String {
        displayValue != "0" && !shouldResetDisplay ? "C" : "AC"
    }

    func buttonTapped(_ button: CalculatorButton) {
        switch button {
        case .digit(let number): handleDigit(number)
        case .decimal:           handleDecimal()
        case .operation(let op): handleOperation(op)
        case .equals:            handleEquals()
        case .clear:             handleClear()
        case .delete:            handleDelete()
        case .toggleSign:        handleToggleSign()
        case .percentage:        handlePercentage()
        }
    }

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
        activeOperation = operation
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
        activeOperation = nil
        shouldResetDisplay = true
    }

    private func handleClear() {
        if displayValue != "0" && !shouldResetDisplay {
            displayValue = "0"
        } else {
            displayValue = "0"
            firstOperand = nil
            pendingOperation = nil
            activeOperation = nil
            shouldResetDisplay = false
        }
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
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 10
        formatter.minimumFractionDigits = 0
        formatter.usesGroupingSeparator = true
        return formatter.string(for: value) ?? "Error"
    }
}
