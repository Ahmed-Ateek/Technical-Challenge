//
//  Presenter.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import Foundation
protocol ArithmeticOperatorsView:class {
    func sendOperators(operators:String)
    func sendResult(result:String)
}
class PresenterArithmeticOperators{
    private weak var delegate:ArithmeticOperatorsView?
    init(delegate:ArithmeticOperatorsView) {
        self.delegate = delegate
    }
    func calculatMethod(){
        let a = 2.25
        let b = 4.50
        let c = 1.25
        let d = 5.0
        let result = (a + b) / c * d
        delegate?.sendOperators(operators: " Operators: (\(a)+\(b)) / \(c) * \(d) ")
        delegate?.sendResult(result: "Result:\(Int(result))")
        print(result)
    }
}
