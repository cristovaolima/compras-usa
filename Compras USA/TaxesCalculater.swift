//
//  TaxesCalculater.swift
//  Compras USA
//
//  Created by Cristovão Lima on 09/08/22.
//

import Foundation

class TaxesCalculater {
    static let shared = TaxesCalculater()
    var dollar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    var formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dollar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * stateTax/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    func calculate(usigCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTax
        if usigCard {
            finalValue += iofValue
        }
        return finalValue * dollar
    }
    
    func convertDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormatted(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
}
