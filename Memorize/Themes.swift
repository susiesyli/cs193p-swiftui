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
        accentColor: .green,
        numberOfPairs: 8),
    Theme(
        name: "Nature",
        emojis: ["💐","🌿","✨","🪷","🪸","🌸","🍀","☁️"],
        color: .green,
        accentColor: .blue,
        numberOfPairs: 8),
    Theme(
        name: "Animals",
        emojis: ["🐶","🐱","🦊","🐻","🐼","🐸","🐯"],
        color: .yellow,
        accentColor: .red,
        numberOfPairs: 7),
    Theme(
        name: "Dessert",
        emojis: ["🍞","🍦","🧁","🍩","🍡","🍪","🍬","🍮","🥞","🍵","🍨","🍰"],
        color: .yellow,
        accentColor: .pink,
        numberOfPairs: 8),
    Theme(
        name: "Food",
        emojis: ["🦪","🍜","🍲","🥘","🍘","🍙","🍥","🌮","🌭","🥗","🍳"],
        color: .yellow,
        accentColor: .red,
        numberOfPairs: 8),
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","☠️","👽","🦹‍♀️","🦇","🌘","🔮"],
        color: .orange,
        accentColor: .red,
        numberOfPairs: 8)
]
