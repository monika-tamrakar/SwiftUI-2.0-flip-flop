//
//  ContentView.swift
//  Shared
//
//  Created by Monika on 28/07/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: CardModel
    
    let columns = [GridItem(.adaptive(minimum: 80))]
    
    @State private var time = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var count = 0
    
    var body: some View {
        if model.allCards.filter({$0.isFlip == false}).count == 0 {
            withAnimation {
                CompletedView()
            }
        } else {
            HStack {
                Text("Total Flip: \(count)").padding(5)
                Spacer()
                Text("Time \(((time % 3600) / 60)) : \((time % 3600) % 60)").onReceive(timer) { val in
                    time += 1
                }.padding(5)
            }
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(model.allCards) { card in
                    CardView(selection: card, count: $count).environmentObject(model).cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
