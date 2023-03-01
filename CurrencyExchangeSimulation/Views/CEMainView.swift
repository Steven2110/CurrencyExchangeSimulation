//
//  CEMainView.swift
//  CurrencyExchangeSimulation
//
//  Created by Steven Wijaya on 01.03.2023.
//

import SwiftUI
import Charts

struct CEMainView: View {
    
    @State private var firstCurrency: ECurrency = .USD
    @State private var secondCurrency: ECurrency = .EUR
    
    struct Currency: Identifiable {
        let id: UUID = UUID()
        var name: String
        var rate: Double
        var day: Int
    }
    
    private var currencies: [Currency] = [
        Currency(name: "USD", rate: 79.8, day: 1),
        Currency(name: "EUR", rate: 89.8, day: 1),
        Currency(name: "USD", rate: 80.3, day: 2),
        Currency(name: "EUR", rate: 88.8, day: 2),
        Currency(name: "USD", rate: 78.3, day: 3),
        Currency(name: "EUR", rate: 90.1, day: 3),
        Currency(name: "USD", rate: 77.8, day: 4),
        Currency(name: "EUR", rate: 89.9, day: 4),
        Currency(name: "USD", rate: 76.3, day: 5),
        Currency(name: "EUR", rate: 88.8, day: 5)
    ]
    
    
    var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Pick first currency")
                    Picker("", selection: $firstCurrency) {
                        ForEach(ECurrency.allCases, id: \.self) { currency in
                            Text("\(currency.rawValue) - \(getInitialPrice(of: currency), specifier: "%.3f") RUB")
                        }
                    }.labelsHidden()
                }
                VStack(alignment: .leading) {
                    Text("Pick second currency")
                    Picker("", selection: $secondCurrency) {
                        ForEach(ECurrency.allCases, id: \.self) { currency in
                            Text("\(currency.rawValue) - \(getInitialPrice(of: currency), specifier: "%.3f") RUB")
                        }
                    }.labelsHidden()
                }
                HStack {
                    Button {

                    } label: {
                        Text("Start timer")
                    }
                    Button {
                        
                    } label: {
                        Text("Stop timer")
                    }
                    Button {
                        
                    } label: {
                        Text("Reset")
                    }
                }
            }
            .padding()
            .frame(width: 500)
            .frame(maxHeight: .infinity)
            VStack {
                Chart(currencies) { currencyRate in
                    LineMark(x: .value("Day", currencyRate.day), y: .value("Rate", currencyRate.rate))
                        .foregroundStyle(by: .value("Currency", currencyRate.name))
                    PointMark(x: .value("Day", currencyRate.day), y: .value("Price", currencyRate.rate))
                        .annotation {
                            Text("\(currencyRate.rate, specifier: "%.3f")")
                        }
                        .foregroundStyle(by: .value("Currency", currencyRate.name))
                }
                .padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CEMainView_Previews: PreviewProvider {
    static var previews: some View {
        CEMainView()
    }
}

extension CEMainView {
    enum ECurrency: String, CaseIterable {
        case USD, EUR, ISK, NOK, IDR, JPY, CNY
    }
    
    func getInitialPrice(of currency: ECurrency) -> Double {
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
}
