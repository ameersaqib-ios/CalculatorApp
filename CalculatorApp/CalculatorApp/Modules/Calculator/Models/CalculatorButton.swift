//
//  CalculatorButton.swift
//  CalculatorApp
//
//  Created by Meer on 04/06/2026.
//

import Foundation

enum CalculatorButton: Hashable {
    case digit(Int)
    case decimal
    case operation(CalculatorOperation)
    case equals
    case clear
    case delete
    case toggleSign
    case percentage

    var displayTitle: String {
        switch self {
        case .digit(let number): return "\(number)"
        case .decimal:           return "."
        case .operation(let op): return op.symbol
        case .equals:            return "="
        case .clear:             return "AC"
        case .delete:            return "⌫"
        case .toggleSign:        return "+/-"
        case .percentage:        return "%"
        }
    }
}

enum CalculatorOperation {
    case add, subtract, multiply, divide

    var symbol: String {
        switch self {
        case .add:      return "+"
        case .subtract: return "−"
        case .multiply: return "×"
        case .divide:   return "÷"
        }
    }
}
