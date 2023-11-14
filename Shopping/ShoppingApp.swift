//
//  ShoppingApp.swift
//  Shopping
//
//  Created by Yusron Alfauzi on 12/11/23.
//

import SwiftUI

@main
struct ShoppingApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
