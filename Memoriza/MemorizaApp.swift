//
//  MemorizaApp.swift
//  Memoriza
//
//  Created by Dev C Krishna on 25/08/22.
//

import SwiftUI

@main
struct MemorizaApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
