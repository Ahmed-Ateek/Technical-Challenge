//
//  MainCurrencyModel.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import Foundation
struct MainCurrencyModel: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
struct ObjectRate {
    let country:String
    let currency:Double
}
