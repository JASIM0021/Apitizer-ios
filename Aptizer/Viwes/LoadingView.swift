//
//  LoadingView.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 04/09/24.
//

import Foundation
import SwiftUI

struct ActivityIndecator:UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndecatorView = UIActivityIndicatorView(style:.large)
        activityIndecatorView.color = UIColor(resource: .brandPrimary)
        activityIndecatorView.startAnimating()
        return activityIndecatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    
    
//    typealias UIViewType = UIActivityIndicatorView()
    
    
    
}

struct LoadingView : View{
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            ActivityIndecator()
        }
    }
}
