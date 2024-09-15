//
//  ContentView.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import SwiftUI

struct AptizerTabView: View {
    
    @EnvironmentObject var order : Order
    var body: some View {
       
        TabView{
            AppitizerListview()
                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
//                    Image(systemName: "person")
//                    Text("Account")
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
//                    Image(systemName: "bag")
//                    Text("Order")
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AptizerTabView()
}
