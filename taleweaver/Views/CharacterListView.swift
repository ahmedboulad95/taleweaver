//
//  CharacterListView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/30/20.
//

import SwiftUI

struct CharacterListView: View {
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        /*List(characters) { character in
            CharacterTileView(character: character)
        }*/
        LazyVGrid(columns: layout, spacing: 20) {
            ForEach(characters, id: \.self) { character in
                CharacterTileView(character: character)
            }
        }
        .padding(.horizontal)
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
