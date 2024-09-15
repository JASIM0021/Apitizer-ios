//
//  ApetizerListCell.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import SwiftUI

struct ApetizerListCell: View {
    
    var item : Apitizer
    var body: some View {
        HStack{
//            Image(.asianFlankSteak)
//            ApetizerRemoteImage(urlString: item.imageURL ?? "")
//                .resizable()
            AsyncImage(url: URL(string:item.imageURL ?? ""), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120,height: 90)
                    .cornerRadius(8.0)
            }, placeholder: {
                Image(.foodPlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120,height: 90)
                    .cornerRadius(8.0)
                
            })
                
            
            VStack(alignment:.leading,spacing: 8){
                
                Text(item.name ?? "")
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(item.price ?? 0 ,specifier:"%.2f")")
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ApetizerListCell(item: MocData.apizerSampledata.first!)
}
