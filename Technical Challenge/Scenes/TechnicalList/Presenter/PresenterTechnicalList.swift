//
//  PresenterTechnicalList.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import Foundation
import UIKit
protocol TechnicalListView:class {
    func segueToVC(vcID:String)
}
class PresenterTechnicalList{
    private let interactor = InteractorTechnicalList()
    private weak var delegate:TechnicalListView?
    init(delegate:TechnicalListView){
        self.delegate = delegate
    }
    
    func returnTableViewCount() -> Int{
        return interactor.returntTechnicallList().count
    }
    func configureCell(cell:UITableViewCell,index:Int){
        cell.textLabel?.text = interactor.returntTechnicallList()[index]
    }
    func didSelectIndex(index:Int){
        switch index {
        case 0:
            delegate?.segueToVC(vcID: "ArithmeticOperatorsVC")
        case 1:
            delegate?.segueToVC(vcID: "AnagramsVC")
        case 2:
            delegate?.segueToVC(vcID: "FibonacciNumbersVC")
        case 3:
            delegate?.segueToVC(vcID: "CurrencyListVC")
        default:
            break
        }
    }
}
