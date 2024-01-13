//
//  CardView.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 27/10/23.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    var onTap: () -> ()
    @State var degrees: Double = 0.0
    
    var body: some View {
        ZStack {
            Image(card.imageContent)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("primaryGreen"))
                .opacity(card.isShown ? 0 : 1)
        }
        .rotation3DEffect(.degrees(degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
        .onTapGesture {
           flipAndTap()
        }

    }
    
    func flipAndTap() {
        let animationTime = 1.0
        withAnimation(Animation.linear(duration: animationTime), {
            degrees += 180
        })
        withAnimation(Animation.linear(duration: 0.00001).delay(animationTime / 2), {
            onTap()
        })
    }

}



#Preview {
    let previewCard = Card(imageContent: "1")
    return CardView(card: previewCard, onTap: {
        print("Tap")
    })
}
