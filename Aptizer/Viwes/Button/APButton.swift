//
//  APButton.swift
//  Aptizer
//
//  Created by Sk Jasimuddin on 09/09/24.
//

import SwiftUI

struct APButton: View {
    let title : LocalizedStringKey
    var body: some View {
        Text(title)
//            .modifier(StandardButtonStyle())
            .standardButtonStyle()
    }
}

#Preview {
    APButton(title: "Button")
}
