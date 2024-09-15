//
//  Order.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 10/09/24.
//

import Foundation

final class Order : ObservableObject {
    @Published var items : [Apitizer] = []
    
    func add(_ apetizer:Apitizer){
        items.append(apetizer)
    }
    var totalPrice : Double {
        items.reduce(0) { $0 + ($1.price ?? 0) }
    }
    
    func deleteItem(at offset:IndexSet){
        
       items.remove(atOffsets: offset)
    }
}
