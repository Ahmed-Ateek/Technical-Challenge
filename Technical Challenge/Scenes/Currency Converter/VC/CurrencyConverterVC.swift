//
//  CurrencyConverterVC.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import UIKit

class CurrencyConverterVC: UIViewController {
    @IBOutlet weak var currentCurrency:UITextField!
    @IBOutlet weak var selectedCurrency:UILabel!
    @IBOutlet weak var amount:UITextField!
    var presenter:PresenterCurrencyConverter!
    var selectedCurrenc:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    

    @IBAction func convert(_ sender:UIButton){
        presenter.convertCurrency(amount: amount.text!, selectedCurrency: selectedCurrency.text!, toCurrency:  currentCurrency.text!)
    }

}
extension CurrencyConverterVC{
    private func setupView(){
      presenter =  PresenterCurrencyConverter(delegate: self)
        currentCurrency.text = "EUR"
        selectedCurrency.text = selectedCurrenc
    }
}
extension CurrencyConverterVC:CurrencyConvertView{
    func sendAmount(amount: String) {
        self.amount.text =  amount
    }
    
    
}
