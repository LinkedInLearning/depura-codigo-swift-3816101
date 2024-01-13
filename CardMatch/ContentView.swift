//
//  ContentView.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 90))], spacing: 0.0, content: {
                ForEach(viewModel.cards) { card in
                    CardView(card: card) {
                        viewModel.selectCard(card)
                    }
                    .shadow(radius: 10)
                    .padding(5)
                }
            })
            Spacer()
            restartButton
            suffleButton
        }.padding(.top)
    }
    
    var restartButton: some View {
        Button(action: {
            viewModel.restart()
        }, label: {
            HStack {
                Text("RESTART")
                Image(systemName: "play.circle")
            }.primaryButtonStyle()
        })
    }
    
    var suffleButton: some View {
        Button(action: {
            withAnimation {
                viewModel.shuffleCards()
            }
        }, label: {
            HStack {
                Text("BARAJAR")
                Image(systemName: "shuffle.circle")
            }.primaryButtonStyle()
        })

    }
    
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
