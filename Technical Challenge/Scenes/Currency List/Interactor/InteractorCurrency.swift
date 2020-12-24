//
//  InteractorCurrency.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import Foundation
class InteractorCurrency {
    func getMainCurrncy(completion:@escaping CompletionHandler<MainCurrencyModel>){
       
        RequestManager.sharesInstance.request(fromUrl: allCurrency , byMethod: .get, withParameters: nil) { (error:String?, code:Int?, result:MainCurrencyModel?) in
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
