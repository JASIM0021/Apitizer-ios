//
//  AptizerApp.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import SwiftUI

@main
struct AptizerApp: App {
    
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AptizerTabView()
                .environmentObject(order)
        }
    }
}
