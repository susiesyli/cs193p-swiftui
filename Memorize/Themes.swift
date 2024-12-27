//
//  Themes.swift
//  Memorize
//
//  Created by Susie Li on 12/27/24.
//

import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var accentColor: Color
    var numberOfPairs: Int?
}

let themes: [Theme] = [
    Theme(
        name: "Christmas",
        emojis: ["🎄","🦌","✨","❄️","☃️","🍪","🍫","🪵"],
        color: .red,
        accentColor: .red,
        numberOfPairs: 8),
    Theme(
        name: "Nature",
        emojis: ["💐","🌿","✨","🪷","🎄","🪸","🌸","🍀","☁️"],
        color: .green,
        accentColor: .red,
        numberOfPairs: 9),
    Theme(
        name: "Animals",
        emojis: ["🐶","🐱","🦊","🐻","🐼","🐸","🐯"],
        color: .yellow,
        accentColor: .red,
        numberOfPairs: 7),
    Theme(
        name: "Dessert",
        emojis: ["🍞","🍦","🧁","🍩","🍡","🍪","🍮","🥞","🍵","🍨","🍰"],
        color: .pink,
        accentColor: .red,
        numberOfPairs: 11   ),
    Theme(
        name: "Food",
        emojis: ["🦪","🍜","🍲","🥘","🍘","🍙","🍥","🍬","🌮","🌭","🥗","🍳"],
        color: .white,
        accentColor: .red,
        numberOfPairs: 12),
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","☠️","👽","🦹‍♀️","🦇","🌘","🔮"],
        color: .orange,
        accentColor: .red,
        numberOfPairs: 9)
]
