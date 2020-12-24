//
//  PresenterCurrencyConverter.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import Foundation
protocol CurrencyConvertView:class {
    func sendAmount(amount:String)
}

class PresenterCurrencyConverter {
    private weak var delegate:CurrencyConvertView?
    private var interactor = InteractorCurrencyConverter()
    init(delegate:CurrencyConvertView) {
        self.delegate = delegate
        
    }
    func convertCurrency(amount:String,selectedCurrency:String,toCurrency:String)  {
        interactor.convertCurrncy(selectedCurrency: selectedCurrency, toCurrency: toCurrency, amount: amount) { (error, code, result) in
            
        }
    }
    
}
