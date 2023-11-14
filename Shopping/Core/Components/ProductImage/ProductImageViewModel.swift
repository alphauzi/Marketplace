//
//  ProductImageViewModal.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation
import Combine
import SwiftUI

class ProductImageViewModel: ObservableObject{
    
    @Published var image: UIImage? = nil
    
    private let product: ProductModel
    private let dataServices: ProductImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(product: ProductModel) {
        self.product = product
        self.dataServices = ProductImageService(product: product)
        addSubscribers()
    }
    
    private func addSubscribers(){
        dataServices.$image
            .sink { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
    
}
