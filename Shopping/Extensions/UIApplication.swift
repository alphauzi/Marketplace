//
//  UIApplication.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 13/11/23.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
