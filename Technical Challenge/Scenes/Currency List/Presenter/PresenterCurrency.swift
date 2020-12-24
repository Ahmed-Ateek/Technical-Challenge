//
//  PresenterCurrency.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import Foundation
import UIKit
protocol CurrencyView:class {
    func currencyLoaded()
    func goToConvertCurrency(selectedCurrency:String)
}
class PresenterCurrency {
    private weak var delegate:CurrencyView?
    private let interactor = InteractorCurrency()
    private var currencyListData = [ObjectRate]()
    init(delegate:CurrencyView) {
        self.delegate = delegate
    }
    func getCurrncy(){
        interactor.getMainCurrncy { (error, code, result) in
            if code == 200 {
                for (key,value) in result!.rates  {
                    self.currencyListData.append(.init(country: key, currency: value))
                }
                self.currencyListData = self.currencyListData.sorted { $0.country.lowercased() < $1.country.lowercased() }
                self.delegate?.currencyLoaded()
                
            }
        }
    }
    func sendCountToTable() -> Int{
        return currencyListData.count
    }
    func configureCell(cell:UITableViewCell,index:Int)  {

        cell.textLabel?.text = currencyListData[index].country + ": \(currencyListData[index].currency)"
    }
    func didSelectCurrency(index:Int){
        let currency = currencyListData[index].country
        delegate?.goToConvertCurrency(selectedCurrency: currency)
    }
}
