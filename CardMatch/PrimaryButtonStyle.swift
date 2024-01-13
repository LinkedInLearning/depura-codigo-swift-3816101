//
//  ButtonStyle.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 29/11/23.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(Color("whitetext", bundle: nil))
            .font(.title3)
            .frame(maxWidth: .infinity)
            .background(Color("primaryGreen", bundle: nil), in: RoundedRectangle(cornerRadius: 20))
            .padding()
    }
    
}

extension View {
    func primaryButtonStyle() -> some View {
        self.modifier(PrimaryButtonStyle())
    }
}
