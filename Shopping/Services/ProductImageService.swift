//
//  ProductImageService.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation
import Combine
import SwiftUI

class ProductImageService{
    
    @Published var image: UIImage? = nil
    private let imageName: String
    private let product: ProductModel
    private let fileManager = LocaleFileManager.instance
    private let folderName = "product_images"
    
    private var imageSubscription: AnyCancellable?
    
    init(product: ProductModel) {
        self.imageName = product.title
        self.product = product
        getProductImage()
    }
    
    private func getProductImage(){
        if let saveImage = fileManager.getImage(imageName: imageName, folderName: folderName){
            image = saveImage
            print("retrieved image from file manager!")
        }else{
            downloadProductImage()
            print("downloading image now")
        }
    }
    
    private func downloadProductImage(){
        guard let url = URL(string: product.image) else {return}
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedImages in
                guard let self = self, let downloadImage = returnedImages else {return}
                self.image = downloadImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: imageName, folderName: folderName)
            })
    }
}
