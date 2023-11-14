//
//  Double.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation

extension Double{
    
    // convert a double into a currency as a string with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "0.00"
    }
    
    /// convert a double into a currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // default value
//        formatter.currencyCode = "idr" // change currency
//        formatter.currencySymbol = "Rp" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// convert a double into a string representation
    /// ```
    /// Convert 1.23456 to "1.2"
    /// ```
    func asNumberSring() -> String{
        return String(format: "%.1f", self)
    }
}
