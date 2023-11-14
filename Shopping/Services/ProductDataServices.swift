//
//  ProductDataServices.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation
import Combine

class ProductDataServices{
    
    @Published var allProduct: [ProductModel] = []
    var productSubscription: AnyCancellable?
    
    init(){
        getProducts()
    }
    
    func getProducts(){
        guard let url = URL(string: "https://fakestoreapi.com/products") else {return}
        
        productSubscription = NetworkingManager.download(url: url)
            .decode(type: [ProductModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedProducts in
                self?.allProduct = returnedProducts
                self?.productSubscription?.cancel()
            })
    }
}
