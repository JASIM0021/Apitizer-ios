//
//  EmptyState.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 09/09/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName : String
    
    let title : String
    
    var body: some View {
        
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 160)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    
            }
            .offset(y:-50)
            .padding()
        }
       
    }
}

#Preview {
    EmptyState(imageName: "empty-order", title: "This is a test title")
}
