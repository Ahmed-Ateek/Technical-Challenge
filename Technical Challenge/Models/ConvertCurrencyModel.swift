//
//  ConvertCurrencyModel.swift
//  Technical Challenge
//
//  Created by Tk on 24/12/2020.
//

import Foundation
struct ConvertCurrencyModel: Codable {
    let success: Bool
    let query: Query
    let info: Info
    let historical, date: String
    let result: Double
}

// MARK: - Info
struct Info: Codable {
    let timestamp: Int
    let rate: Double
}

// MARK: - Query
struct Query: Codable {
    let from, to: String
    let amount: Int
}
