//
//  CompletedView.swift
//  FlipFlop (iOS)
//
//  Created by Monika on 28/07/20.
//

import SwiftUI

struct CompletedView: View {
    @State private var showMsg = false
    
    var body: some View {
        VStack{
            Text("You did it !!!!").font(.system(size: 25)).foregroundColor(.orange).frame(width: 200, height: 200, alignment: .center)
        }.background(Color.white).frame(width: 200, height: 200)
        .scaleEffect(showMsg ? 1 : 0)
        .cornerRadius(100)
        .shadow(color: .orange, radius: 100, x: 1, y: 1)
        .animation(Animation.easeInOut(duration: 0.5).delay(0.1))
            .onAppear() {
                self.showMsg.toggle()

        }
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}
