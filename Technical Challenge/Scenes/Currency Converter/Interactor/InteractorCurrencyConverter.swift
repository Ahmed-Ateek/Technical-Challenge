//
//  InteractorCurrencyConverter.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import Foundation
class  InteractorCurrencyConverter{
    func convertCurrncy(selectedCurrency:String,toCurrency:String,amount:String,completion:@escaping CompletionHandler<ConvertCurrencyModel>){
   
    RequestManager.sharesInstance.request(fromUrl: currencyConverURL + "from=\(selectedCurrency)&to=\(toCurrency)&amount=\(amount)"  , byMethod: .get, withParameters: nil) { (error:String?, code:Int?, result:ConvertCurrencyModel?) in
        guard let chat = result else {
            completion("خطأ",ErrorsCodes.castError.rawValue,nil)
            return
        }
        // API Return Error
        if error != nil {
            completion(error,code,chat)
        }else{
            //Done
            completion(nil,code,chat)
        }

    }
}
}
