//
//  PresenterFibonacciSeq.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import Foundation
protocol FibonacciSeqView:class {
    func showSequence(sequence:[Int])
}
class PresenterFibonacciSeq {
    private weak var delegate:FibonacciSeqView?
    init(delegate:FibonacciSeqView) {
        self.delegate = delegate
    }
    
    func fiboSequence(num:Int){
        var sequence = [0,1]
        if num <= 1 {return}
        for _ in 0...num - 2 {
            let firstNum = sequence[sequence.count - 2 ]
            let secondNum = sequence.last!
            sequence.append(firstNum + secondNum)
            
        }
        delegate?.showSequence(sequence: sequence)
    }
    func recursive(num:Int,firstNum:Int,secondNum:Int) -> [Int] {
        if num == 0 {return []}
        
        return [firstNum+secondNum] + recursive(num:num -  1 , firstNum: secondNum, secondNum: firstNum + secondNum)
    }
    
    func fiboRecurstion(num:Int){
        delegate?.showSequence(sequence: [0,1]+recursive(num: num, firstNum: 0, secondNum: 1))
    }
}
