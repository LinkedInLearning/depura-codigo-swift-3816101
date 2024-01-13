//
//  CardMatchApp.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 27/10/23.
//

import SwiftUI

@main
struct CardMatchApp: App {
    @StateObject var viewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
