//
//  HomeView.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                SearchBarView(searchText: $vm.searchText)
                categories
                productItems
                
            }
            
            .navigationTitle("Shopping")
            .padding(.horizontal, 10)
            .background(Color.gray.opacity(0.1))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
        .environmentObject(DeveloperPreview.instance.homeVM)
}

extension HomeView{
    private var categories: some View{
        ScrollView(.horizontal) {
            HStack(spacing: 25){
                Text("All")
                    .underline(vm.categoryProduct == .all)
                    .foregroundStyle(vm.categoryProduct == .all ? Color.blue : Color.black)
                    .onTapGesture {
                        vm.categoryProduct = .all
                        vm.filterProduct = vm.allProduct
                    }
                Text("Men")
                    .underline(vm.categoryProduct == .mensClothing)
                    .foregroundStyle(vm.categoryProduct == .mensClothing ? Color.blue : Color.black)
                    .onTapGesture {
                        vm.categoryProduct = .mensClothing
                        vm.filterProduct = vm.filterCategory(filter: .mensClothing, products: vm.allProduct)
                    }
                Text("Women")
                    .underline(vm.categoryProduct == .womensClothing)
                    .foregroundStyle(vm.categoryProduct == .womensClothing ? Color.blue : Color.black)
                    .onTapGesture {
                        vm.categoryProduct = .womensClothing
                        vm.filterProduct = vm.filterCategory(filter: .womensClothing, products: vm.allProduct)
                    }
                Text("Electronics")
                    .underline(vm.categoryProduct == .electronics)
                    .foregroundStyle(vm.categoryProduct == .electronics ? Color.blue : Color.black)
                    .onTapGesture {
                        vm.categoryProduct = .electronics
                        vm.filterProduct = vm.filterCategory(filter: .electronics, products: vm.allProduct)
                    }
                Text("Jewelery")
                    .underline(vm.categoryProduct == .jewelery)
                    .foregroundStyle(vm.categoryProduct == .jewelery ? Color.blue : Color.black)
                    .onTapGesture {
                        vm.categoryProduct = .jewelery
                        vm.filterProduct = vm.filterCategory(filter: .jewelery, products: vm.allProduct)
                    }
            }
            .padding(.horizontal, 10)
        }
        .scrollIndicators(.hidden)
    }
    
    private var productItems: some View{
        ScrollView{
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(vm.filterProduct) { product in
                    ProductRowView(product: product)
                }
            }
        }
    }
    
}
