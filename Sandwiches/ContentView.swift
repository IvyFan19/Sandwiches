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
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleSandwiches)
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .toolbar{
                EditButton()
                Button("Add", action: makeSandwich)
            }
        }
    }
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Add melt", ingredientCount: 3))
        }
    }
    func moveSandwiches(from: IndexSet, to:Int) {
        withAnimation{
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    func deleSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
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
        }
        .navigationTitle("Sandwiches")
    }
}

#Preview {
    ContentView(store: testStore)
}
