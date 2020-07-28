//
//  CardView.swift
//  FlipFlop (iOS)
//
//  Created by Monika on 28/07/20.
//

import SwiftUI

struct CardView: View {
    
    @State var flipped: Bool = false
    
    @State var degrees: Double = 180.0
    
    @EnvironmentObject private var model: CardModel
    
    @State var selection: Card
    
    @Binding var count: Int
    
    var body: some View {
        ZStack {
            if flipped {
                CardBack(card: selection)
            } else {
                CardFront()
            }
        }.background(Color.orange)
        .cornerRadius(10)
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            count += 1
            model.selectCard(id: selection.id)
            if let selected = model.selectedCard(), !selected.isFlip {
                model.cardFlip(val: !selection.isFlip)
                if self.flipped {
                    self.flipped = false
                    withAnimation {
                        self.degrees += 180
                    }
                } else {
                    self.flipped = true
                    withAnimation {
                        self.degrees -= 180
                    }
                }
                
                if model.allCards.filter({$0.isFlip == true}).count % 2 == 0  {
                    if model.allCards.filter({$0.isFlip == true && $0 == selection}).count % 2 == 0 {
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            model.cardFlip(val: false)
                            self.flipped = false
                            withAnimation {
                                self.degrees += 180
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CardBack: View {
    var card: Card
    
    var body: some View {
        card.cardImage.font(.system(size: 30)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
    }
}

struct CardFront: View {
    var body: some View {
        Text("").frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
    }
}
