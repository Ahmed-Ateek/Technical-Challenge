//
//  ArithmeticOperatorsVC.swift
//  Technical Challenge
//
//  Created by Tk on 23/12/2020.
//

import UIKit

class ArithmeticOperatorsVC: UIViewController {
    @IBOutlet weak var operatorsLbl:UILabel!
    @IBOutlet weak var resultLbl:UILabel!
    var presenter:PresenterArithmeticOperators!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension ArithmeticOperatorsVC{
    private func setupViews(){
        presenter = PresenterArithmeticOperators(delegate: self)
        presenter.calculatMethod()
    }
}

extension ArithmeticOperatorsVC:ArithmeticOperatorsView{
    func sendOperators(operators: String) {
        operatorsLbl.text = operators
    }
    
    func sendResult(result: String) {
        resultLbl.text = result
    }
}
