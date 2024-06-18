//
//  SandwichesApp.swift
//  Sandwiches
//
//  Created by Ivy Fan on 6/14/24.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
