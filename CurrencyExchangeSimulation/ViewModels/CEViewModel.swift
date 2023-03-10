//
//  CEViewModel.swift
//  CurrencyExchangeSimulation
//
//  Created by Steven Wijaya on 02.03.2023.
//

import Foundation

final class CEViewModel: ObservableObject {
    @Published var exchangeRates: [Currency] = [Currency]()
    
    private var firstCurrency: Currency.ECurrency = .USD
    private var firstCurrencyName: String = ""
    private var firstCurrencyShort: String = ""
    private var firstCurrencyCurrentRate: Double = 0.0
    
    private var secondCurrency: Currency.ECurrency = .EUR
    private var secondCurrencyName: String = ""
    private var secondCurrencyShort: String = ""
    private var secondCurrencyCurrentRate: Double = 0.0
    
    private var day: Int = 1
    
    private var k: Double = 0.05
    
    func inputInitialRate(firstCurrency: Currency.ECurrency, secondCurrency: Currency.ECurrency) {
        self.firstCurrency = firstCurrency
        self.secondCurrency = secondCurrency
        
        var firstC: Currency
        var secondC: Currency
        
        firstCurrencyName = getCurrencyName(of: firstCurrency)
        firstCurrencyShort = getCurrencyShort(of: firstCurrency)
        firstCurrencyCurrentRate = getInitialPrice(of: firstCurrency)
        firstC = Currency(
            name: firstCurrencyName,
            short: firstCurrencyShort,
            rate: firstCurrencyCurrentRate,
            day: day
        )
        
        secondCurrencyName = getCurrencyName(of: secondCurrency)
        secondCurrencyShort = getCurrencyShort(of: secondCurrency)
        secondCurrencyCurrentRate = getInitialPrice(of: secondCurrency)
        secondC = Currency(
            name: secondCurrencyName,
            short: secondCurrencyShort,
            rate: secondCurrencyCurrentRate,
            day: day
        )
        
        exchangeRates.append(firstC)
        exchangeRates.append(secondC)
    }
    
    func startPrediction() {
        day += 1
        
        var firstC: Currency
        var secondC: Currency
        
        firstCurrencyCurrentRate = predictRate(initialPrice: firstCurrencyCurrentRate)
        firstC = Currency(
            name: firstCurrencyName,
            short: firstCurrencyShort,
            rate: firstCurrencyCurrentRate,
            day: day
        )
        
        secondCurrencyCurrentRate = predictRate(initialPrice: secondCurrencyCurrentRate)
        secondC = Currency(
            name: secondCurrencyName,
            short: secondCurrencyShort,
            rate: secondCurrencyCurrentRate,
            day: day
        )
        
        exchangeRates.append(firstC)
        exchangeRates.append(secondC)
    }
    
    private func predictRate(initialPrice: Double) -> Double {
        return initialPrice + initialPrice * k * (Double.random(in: 0...1) - 0.5)
    }
    
    func getCurrentDay() -> Int {
        day
    }
    
    func getCurrentFirstCurrencyRate() -> Double {
        firstCurrencyCurrentRate
    }
    
    func getCurrentSecondCurrencyRate() -> Double {
        secondCurrencyCurrentRate
    }
    
    func getFirstCurrencyProfit() -> Double {
        getCurrentFirstCurrencyRate() - getInitialPrice(of: firstCurrency)
    }
    
    func getSecondCurrencyProfit() -> Double {
        getCurrentSecondCurrencyRate() - getInitialPrice(of: secondCurrency)
    }
    
    func reset() {
        firstCurrency = .USD
        firstCurrencyName = ""
        firstCurrencyShort = ""
        firstCurrencyCurrentRate = 0.0
        
        secondCurrency = .EUR
        secondCurrencyName = ""
        secondCurrencyShort = ""
        secondCurrencyCurrentRate = 0.0
        
        day = 1
        
        exchangeRates.removeAll()
    }
    
    func getDomainLength() -> Int {
        exchangeRates.count / 2 + 1
    }
}
