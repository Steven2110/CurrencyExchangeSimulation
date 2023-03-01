//
//  Utils.swift
//  CurrencyExchangeSimulation
//
//  Created by Steven Wijaya on 01.03.2023.
//

import Foundation

func getInitialPrice(of currency: Currency.ECurrency) -> Double {
    // Initial Price per 1st March
    switch currency {
    case .USD:
        return 75.26
    case .EUR:
        return 80.3
    case .ISK:
        return 0.53
    case .NOK:
        return 7.23
    case .IDR:
        return 0.0049
    case .JPY:
        return 0.55
    case .CNY:
        return 10.96
    }
}
