//
//  DeveloperPreview.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation

class DeveloperPreview{
    static let instance = DeveloperPreview()
    private init(){}
    
    let homeVM = HomeViewModel()
    
    let product = ProductModel(
        id: 1,
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.95,
        description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        category: "men's clothing",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: Rating(
            rate: 3.9,
            count: 120)
        )

}
