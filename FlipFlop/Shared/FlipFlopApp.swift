//
//  FlipFlopApp.swift
//  Shared
//
//  Created by Monika on 28/07/20.
//

import SwiftUI

@main
struct FlipFlopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CardModel())
        }
    }
}
