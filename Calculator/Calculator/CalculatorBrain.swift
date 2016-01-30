//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by jimmychain on 1/25/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    // enum只能拥有computed properties
    // enum可以关联类型
    // make privte thing private
    private enum Op : CustomStringConvertible{
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol,_):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()
    
    var program: AnyObject {// PropertyList
        get {
            return opStack.map { $0.description }
        }
        set {
            if let opSymbols = newValue as? Array<String> {
                var newOpStack = [Op]()
                for opSymbol in opSymbols {
                    if let op = knownOps[opSymbol] {
                        newOpStack.append(op)
                    } else if let operand = NSNumberFormatter().numberFromString(opSymbol)?.doubleValue {
                        newOpStack.append(Op.Operand(operand))
                    }
                }
                opStack = newOpStack
            }
        }
    }
    
    private var knownOps = [String:Op]()
    
    init() {
        func learOp(op: Op) {
            knownOps[op.description] = op
        }
        knownOps["×"] = Op.BinaryOperation("×", * )
        knownOps["+"] = Op.BinaryOperation("+", + )
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        if !ops.isEmpty {
            var remainingOps = ops//复制一份, 因为参数传过来的是let
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operationEvaluate = evaluate(remainingOps)
                if let operand = operationEvaluate.result {
                    return (operation(operand), operationEvaluate.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluate = evaluate(remainingOps)
                if let operand1 = op1Evaluate.result {
                    let op2Evaluate = evaluate(op1Evaluate.remainingOps)
                    if let operand2 = op2Evaluate.result {
                        return (operation(operand1, operand2), op2Evaluate.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand: Double) -> Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double?{
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
}