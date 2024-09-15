//
//  CustomModifier.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 11/09/24.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

extension View {
 
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
