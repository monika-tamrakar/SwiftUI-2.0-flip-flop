//
//  Card.swift
//  FlipFlop (iOS)
//
//  Created by Monika on 28/07/20.
//

import Foundation

import SwiftUI

class Card: Identifiable {
    private(set) var id: String
    private(set) var cardImage: Image
    @Published var isFlip = false
    
    init(id: String, cardImage: Image) {
        self.id = id
        self.cardImage = cardImage
    }
}

extension Card: Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.cardImage == rhs.cardImage
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Card {
    
    static let all: [Card] = [
        .star,
        .star2,
        .starFill,
        .starFill2,
        .heart,
        .heart2,
        .heartFill,
        .heartFill2,
        .video,
        .video2,
        .videoFill,
        .videoFill2,
        .mic,
        .mic2,
        .micFill,
        .micFill2,
        .hifispeaker,
        .hifispeaker2,
        .hifispeakerFill,
        .hifispeakerFill2
    ]
    
    static let allIDs: [Card.ID] = all.map { $0.id }
    
    static let star = Card(id: "star", cardImage: Image(systemName: "star"))
    static let starFill = Card(id: "star-fill", cardImage: Image(systemName: "star.fill"))
    static let heart = Card(id: "heart", cardImage: Image(systemName: "heart"))
    static let heartFill = Card(id: "heart-fill", cardImage: Image(systemName: "heart.fill"))
    static let video = Card(id: "video", cardImage: Image(systemName: "video"))
    static let videoFill = Card(id: "video-fill", cardImage: Image(systemName: "video.fill"))
    static let mic = Card(id: "mic", cardImage: Image(systemName: "mic"))
    static let micFill = Card(id: "mic-fill", cardImage: Image(systemName: "mic.fill"))
    static let hifispeaker = Card(id: "hifispeaker", cardImage: Image(systemName: "hifispeaker"))
    static let hifispeakerFill = Card(id: "hifispeaker-fill", cardImage: Image(systemName: "hifispeaker.fill"))
    
    static let star2 = Card(id: "star2", cardImage: Image(systemName: "star"))
    static let starFill2 = Card(id: "star-fill2", cardImage: Image(systemName: "star.fill"))
    static let heart2 = Card(id: "heart2", cardImage: Image(systemName: "heart"))
    static let heartFill2 = Card(id: "heart-fill2", cardImage: Image(systemName: "heart.fill"))
    static let video2 = Card(id: "video2", cardImage: Image(systemName: "video"))
    static let videoFill2 = Card(id: "video-fill2", cardImage: Image(systemName: "video.fill"))
    static let mic2 = Card(id: "mic2", cardImage: Image(systemName: "mic"))
    static let micFill2 = Card(id: "mic-fill2", cardImage: Image(systemName: "mic.fill"))
    static let hifispeaker2 = Card(id: "hifispeaker2", cardImage: Image(systemName: "hifispeaker"))
    static let hifispeakerFill2 = Card(id: "hifispeaker-fill2", cardImage: Image(systemName: "hifispeaker.fill"))
}

// MARK: - CardModel

class CardModel: ObservableObject {
    @Published private(set) var allCards = Card.all.shuffled()
    @Published private(set) var selectedCardID: String?
    
    init() {
        
    }
    
    func cardFlip(val: Bool) {
        allCards.first(where: {$0.id == selectedCardID}).map({$0.isFlip = val})
    }
    
    func selectedCard() -> Card? {
        return allCards.first(where: {$0.id == selectedCardID})
    }
    
    func selectCard(id: String) {
        selectedCardID = id
    }
}
