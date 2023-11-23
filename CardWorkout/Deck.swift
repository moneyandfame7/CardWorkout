//
//  Card.swift
//  CardWorkout
//
//  Created by Davyd Darusenkov on 23.11.2023.
//

import UIKit

class Deck {
    private var suits: [String: String] = [
        "D": "diamonds",
        "H": "hearts",
        "C": "clubs",
        "S": "spades",
    ]

    private var ranks: [String: String] = [
        "A": "ace",
        "J": "jack",
        "Q": "queen",
        "K": "king",
    ]

    public var cards: [UIImage] = []

    init() {
        createCards()
    }

    func createCards() {
        // Create cards from 2 to 10.
        for suit in suits {
            for i in 2 ... 10 {
                let image = UIImage(named: "\(i)\(suit.key)")!
                cards.append(image)
            }
            // Create cards with other ranks
            for rank in ranks {
                let image = UIImage(named: "\(rank.key)\(suit.key)")!

                cards.append(image)
            }
        }
    }

    func pickRandomCard() -> UIImage {
        return cards.randomElement()!
    }
}
