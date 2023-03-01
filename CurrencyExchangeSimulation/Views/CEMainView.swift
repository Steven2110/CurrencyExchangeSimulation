//
//  CEMainView.swift
//  CurrencyExchangeSimulation
//
//  Created by Steven Wijaya on 01.03.2023.
//

import SwiftUI
import Charts

struct CEMainView: View {
    
    @State private var firstCurrency: Currency.ECurrency = .USD
    @State private var secondCurrency: Currency.ECurrency = .EUR
    
    
    
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
                    CEPicker(currency: $firstCurrency)
                }
                VStack(alignment: .leading) {
                    Text("Pick second currency")
                    CEPicker(currency: $secondCurrency)
                }
                HStack {
                    startButton
                    stopButton
                    resetButton
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
                }.padding()
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
    private var startButton: some View {
        Button {

        } label: {
            Text("Start timer")
        }
    }
    
    private var stopButton: some View {
        Button {
            
        } label: {
            Text("Stop timer")
        }
    }
    
    private var resetButton: some View {
        Button {
            
        } label: {
            Text("Reset")
        }
    }
}
