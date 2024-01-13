//
//  Card.swift
//  CardMatch
//
//  Created by Radostina Tachova Chergarska on 27/10/23.
//

import Foundation


struct Card: Identifiable, Equatable {
    var id = UUID()
    var isShown: Bool = false
    var isPaired: Bool = false
    let imageContent: String
}
