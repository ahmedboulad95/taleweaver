//
//  CharacterTileView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/30/20.
//

import SwiftUI

struct CharacterTileView: View {
    var character: Character
    
    var body: some View {
        VStack {
            character.image
                .resizable()
                .frame(width: 90, height: 90)
            Text(character.getName())
                .foregroundColor(Color.white)
        }
        .frame(width: 100, height: 100)
        .padding()
    }
}

struct CharacterTileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterTileView(character: characters[0])
            CharacterTileView(character: characters[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
