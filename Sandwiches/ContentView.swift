//
//  ContentView.swift
//  Sandwiches
//
//  Created by Ivy Fan on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store : SandwichStore
    //var sandwiches: [Sandwich] = []
    // @StateObject private var store = SandwichStore()
    
    var body: some View {
        NavigationView {
            List{ // create another container
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView(store: testStore)
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetails(sandwich: sandwich)){
            HStack {
                Image(sandwich.thumbnailName).cornerRadius(8.0)
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }.navigationTitle("Sandwiches")
    }
}
