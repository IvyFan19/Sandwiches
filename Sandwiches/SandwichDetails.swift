//
//  SandwichDetails.swift
//  Sandwiches
//
//  Created by Ivy Fan on 6/15/24.
//

import SwiftUI

struct SandwichDetails: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation{
                        zoomed.toggle()
                    }
                }
            Spacer()
            
            if sandwich.isSpicy && !zoomed{
                HStack {
                Spacer()
                Text("Spicy")
                Spacer()
            }
                .padding(.all)
                .font(.headline)
                .background(Color.red)
                .foregroundColor(.yellow)
        }
    }
    .edgesIgnoringSafeArea(.bottom)
    .navigationTitle(sandwich.name)
    .transition(.move(edge: .bottom))
       
    }
}

#Preview {
    NavigationView{
        SandwichDetails(sandwich: testData[8])
    }
}
