//
//  ContentView.swift
//  Memorize
//
//  Created by Susie Li on 12/21/24.
//

import SwiftUI

struct ContentView: View {
    let xmas = ["🎄", "🦌", "✨", "❄️", "☃️", "🍪", "🍫", "🪵"]
    let animals = ["🐶", "🐱", "🦊", "🐻", "🐼", "🐸", "🐵", "🐯"]
    let nature = ["💐", "🌿", "✨", "🪷", "🎄", "🪸", "🌸", "🍀"]
    
    @State var currentTheme = ["🎄", "🦌", "✨", "❄️", "☃️", "🍪", "🍫", "🪵"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                cards
            }
            Spacer()
            themeButtons
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var themeButtons: some View {
        HStack {
            Button("xmas") {
                currentTheme = xmas
            }
            //.cornerRadius(10)
            
            Button("animals") {
                currentTheme = animals
            }
            //.cornerRadius(10)
            
            Button("nature") {
                currentTheme = nature
            }
            //.cornerRadius(10)
        }
        .font(.title3)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: currentTheme[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > currentTheme.count)
    }
    
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjusters(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)

        }.onTapGesture {
            isFaceUp.toggle() // toggle() switches bool
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
