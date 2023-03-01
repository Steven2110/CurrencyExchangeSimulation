//
//  CEPicker.swift
//  CurrencyExchangeSimulation
//
//  Created by Steven Wijaya on 01.03.2023.
//

import SwiftUI

struct CEPicker: View {
    
    @Binding var currency: Currency.ECurrency
    
    var body: some View {
        Picker("", selection: $currency) {
            ForEach(Currency.ECurrency.allCases, id: \.self) { currency in
                Text("\(currency.rawValue) - \(getInitialPrice(of: currency), specifier: "%.3f") RUB")
            }
        }.labelsHidden()
    }
}

struct CEPicker_Previews: PreviewProvider {
    static var previews: some View {
        CEPicker(currency: .constant(.USD))
    }
}
