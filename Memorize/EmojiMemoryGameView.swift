//
//  ContentView.swift
//  Memorize
//
//  Created by Susie Li on 12/21/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    let xmas =    ["🎄","🦌","✨","❄️","☃️","🍪","🍫","🪵"]
    let animals = ["🐶","🐱","🦊","🐻","🐼","🐸","🐯"]
    let nature =  ["💐","🌿","✨","🪷","🎄","🪸","🌸","🍀","☁️"]
    
    @State var emojis = [""] // initalize as empty
    @State var cardCount = 0 // initalize as empty
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
            Spacer()
            themeButtons
            //Spacer()
            //cardCountAdjusters
        }
        .onAppear {
            selectTheme(theme: nature)
        }
        .padding()
    }
    
    var themeButtons: some View {
        HStack {
            VStack{
                Image(systemName: "snow")
                    .font(.title)
                Text("xmas")
                    .font(.headline)
                    .frame(alignment: .bottom)
            }
            .onTapGesture {
                selectTheme(theme: xmas)
            }
            .frame(alignment: .bottom)
            .padding(.horizontal, 20)
            
            VStack{
                Image(systemName: "pawprint.fill")
                    .font(.title)
                Text("animals")
                    .font(.headline)
                    .frame(alignment: .bottom)
            }
            .onTapGesture {
                selectTheme(theme: animals)
            }
            .frame(alignment: .bottom)
            .padding(.horizontal, 20)
            
            VStack{
                Image(systemName: "cloud.fill")
                    .font(.title)
                Text("nature")
                    .font(.headline)
                    .frame(alignment: .bottom)
            }
            .onTapGesture {
                selectTheme(theme: nature)
            }
            .frame(alignment: .bottom)
            .padding(.horizontal, 20)
        }
        .foregroundColor(.accentColor)
    }
    
    func selectTheme(theme: [String]) {
        emojis = theme.shuffled()
        cardCount = theme.count
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.green)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjusters(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
