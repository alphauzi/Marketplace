//
//  NetworkingManager.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum NetworkingManager: LocalizedError{
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .badURLResponse(url: let url):
                return "[🔥] Bad response from URL: \(url)"
            case .unknown:
                return "[⚠️] Unknown error occured"
            }
        }
    }
    
    //static biar tdk perlu initialize
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ try handleURLresponse(output: $0, url: url) })
            .retry(3) //kalau ada data gagal supaya diulangi 3 kali
            .eraseToAnyPublisher()
    }
    
    static func handleURLresponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingManager.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: (Subscribers.Completion<Error>)){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
