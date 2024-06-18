//
//  SandwichStore.swift
//  Sandwiches
//
//  Created by Ivy Fan on 6/17/24.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = []){
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)
