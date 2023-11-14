//
//  ProductImageView.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import SwiftUI

struct ProductImageView: View {
    
    @StateObject var vm: ProductImageViewModel
    
    init(product: ProductModel) {
        _vm = StateObject(wrappedValue: ProductImageViewModel(product: product))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else{
                Image(systemName: "questionmark")
            }
        }
    }
}

#Preview {
    ProductImageView(product: DeveloperPreview.instance.product)
}
