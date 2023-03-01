//
//  CEMainView.swift
//  CurrencyExchangeSimulation
//
//  Created by Steven Wijaya on 01.03.2023.
//

import SwiftUI
import Charts

struct CEMainView: View {
    
    @StateObject private var vm: CEViewModel = CEViewModel()
    
    @State private var firstCurrency: Currency.ECurrency = .USD
    @State private var secondCurrency: Currency.ECurrency = .EUR    
    
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
                Chart(vm.exchangeRates) { currencyRate in
                    LineMark(x: .value("Day", currencyRate.day), y: .value("Rate", currencyRate.rate))
                        .foregroundStyle(by: .value("Currency", currencyRate.short))
                    PointMark(x: .value("Day", currencyRate.day), y: .value("Price", currencyRate.rate))
                        .annotation {
                            Text("\(currencyRate.rate, specifier: "%.3f")")
                        }
                        .foregroundStyle(by: .value("Currency", currencyRate.short))
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
            vm.inputInitialRate(firstCurrency: firstCurrency, secondCurrency: secondCurrency)
            vm.startPrediction()
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
