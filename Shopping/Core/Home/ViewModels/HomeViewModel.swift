//
//  HomeViewModel.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    @Published var allProduct: [ProductModel] = []
    @Published var filterProduct: [ProductModel] = []
    @Published var searchText: String = ""
    @Published var categoryProduct: CategoryProduct = .all
    
    private let productDataServices = ProductDataServices()
    
    private var cancellables = Set<AnyCancellable>()
    
    enum CategoryProduct{
        case mensClothing, womensClothing, jewelery, electronics, all
    }
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        $searchText
            .combineLatest(productDataServices.$allProduct)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterProducts)
            .sink { [weak self] returnedProduct in
                self?.allProduct = returnedProduct
                self?.filterProduct = returnedProduct
            }
            .store(in: &cancellables)
    }
    
    
    private func filterProducts(text: String, products: [ProductModel]) -> [ProductModel]{
        guard !text.isEmpty else{
            return products
        }
        
        let lowercaseText = text.lowercased()
        return products.filter { (product) in
            return product.title.lowercased().contains(lowercaseText)
        }
    }
    
    func filterCategory(filter: CategoryProduct, products: [ProductModel]) -> [ProductModel]{
        switch filter {
        case .mensClothing:
            return products.filter { product in
                product.category == "men's clothing"
            }
        case .womensClothing:
            return products.filter { product in
                product.category == "women's clothing"
            }
        case .jewelery:
            return products.filter { product in
                product.category == "jewelery"
            }
        case .electronics:
            return products.filter { product in
                product.category == "electronics"
            }
        case .all:
            return products
        }
    }
    
}
