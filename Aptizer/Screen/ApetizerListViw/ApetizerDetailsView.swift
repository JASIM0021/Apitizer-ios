//
//  ApetizerDetailsView.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 06/09/24.
//

import SwiftUI

struct ApetizerDetailsView: View {
    
    let item : Apitizer
    @Binding var isShow : Bool
    
    @EnvironmentObject var order : Order
    var body: some View {
       
        VStack {
            ApetizerRemoteImage(urlString: item.imageURL ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 226)
            VStack{
                
                Text(item.name ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(item.description ?? "")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                
                HStack(spacing:40){
                    
                    NutrationInfo(title: "Caption", value: item.calories ?? 0 )
                    NutrationInfo(title: "Carbs", value: item.carbs ?? 0 )
                    NutrationInfo(title: "Protin", value: item.protein ?? 0 )
                    
                   
                }
            }
            Spacer()
            Button {
                
                isShow = false
                order.add(item)
                print("click")
            } label: {
              APButton(title: "$\(item.price ?? 0 , specifier:"%.2f") - Add to Order")
            }
            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment:.topTrailing){
            
            Button {
                isShow = false
            } label: {
                XDismissButton()
            }
        }
    }
}

#Preview {
    ApetizerDetailsView(item: MocData.sampleApitizer, isShow: .constant(false))
}

struct NutrationInfo: View {
    let title:String
    let value:Int
    var body: some View {
        VStack{
            
//            Text("Caption")
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
    }
}
