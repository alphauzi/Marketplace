//
//  ProductRowView.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import SwiftUI

struct ProductRowView: View {
    
    let product: ProductModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            ProductImageView(product: product)
                .frame(width: 150, height: 150)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(product.title)
                .font(.title2)
                .lineLimit(2)
            HStack {
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.orange)
                Text(product.rating.rate.asNumberSring())
                    .bold()
            }
            .font(.footnote)
            .padding(9)
            .border(Color.orange, width: 1.5)
            .background(content: {
                Rectangle()
                    .fill(Color.yellow.opacity(0.3))
            })
            Text(product.price.asCurrencyWith2Decimals())
                .bold()
                .font(.title)
        }
        .padding()
        .background(content: {
           RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
        })
    }
}

#Preview {
    ProductRowView(product: DeveloperPreview.instance.product)
}
