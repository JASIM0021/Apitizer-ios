//
//  OrderView.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import SwiftUI

struct OrderView: View {
    @State var orderItem = MocData.apizerSampledata
    @EnvironmentObject var order : Order
    var body: some View {
        
       
        NavigationView{
            
            ZStack{
                VStack{
                    
                    List{
                        ForEach(order.items){item in
                            
                            ApetizerListCell(item: item)
                        }
//                        .onDelete(perform: { indexSet in
//                            
//                            deleteItem(at: indexSet)
//                        })
                        .onDelete(perform: order.deleteItem)
                       
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("order placed")
                    } label: {
                        APButton(title: "\(order.totalPrice,specifier:"%.2f") - Place Order" )
                    }
                    .padding(.bottom,26)
                }
                
                if order.items.isEmpty {
                    
                    EmptyState(imageName: "empty-order", title: "You have no item in your order .\n Please add an apitizer")
                }
            }
            
            .navigationTitle("🧾 Orders")
        }
        
        
    
      
    }
//    func deleteItem(at offset:IndexSet){
//        
//        order.items.remove(atOffsets: offset)
//    }
  
   
}

#Preview {
    OrderView()
}
