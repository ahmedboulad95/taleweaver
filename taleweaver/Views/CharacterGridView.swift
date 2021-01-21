//
//  CharacterGridView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/20/21.
//

import SwiftUI

struct CharacterGridView: View {
    var characters: [Character]
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
    var body: some View {
        LazyVGrid(columns:gridItemLayout, spacing: 20) {
            ForEach(characters, id: \.self) { character in
                CharacterTileView(character: character)
            }
        }
    }
}

struct CharacterGridView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGridView(characters: tale!.events[0].characters)
    }
}
