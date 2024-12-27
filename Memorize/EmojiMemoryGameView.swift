//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Susie Li on 12/21/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            gameTitle
            themeTitle
            
            ScrollView{
                cards.animation(.default, value: viewModel.cards )
            }
            
            HStack {
                newGameButton
                Spacer()
                showScore
                Spacer()
                shuffleButton
            }
            .foregroundColor(viewModel.theme.color)
        }
        .padding()
    }
    
    var gameTitle: some View {
        Text("Memorize!").font(.largeTitle).foregroundColor(viewModel.theme.accentColor)
    }
    
    var themeTitle: some View {
        Text(viewModel.theme.name)
            .font(.title2)
            .foregroundColor(viewModel.theme.color)
    }
    
    var newGameButton: some View {
        Button(action: {
            viewModel.newGame()
        }, label: {
            VStack(spacing: 5) {
                Image(systemName:"plus.circle.fill")
                    .font(.largeTitle)
                Text("New Game")
            }
        })
    }
    
    var showScore: some View {
        Text("Score: \(viewModel.score)")
            .font(.title)
            .foregroundColor(viewModel.theme.accentColor)
    }
    
    var shuffleButton: some View {
        Button(action: {
            viewModel.shuffle()
        }, label: {
            VStack(spacing: 5) {
                Image(systemName: "shuffle.circle.fill").font(.largeTitle)
                Text("Shuffle")
            }
        })
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.theme.color)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
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
