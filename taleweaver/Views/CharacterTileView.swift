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
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .fill(Color(hue: 180.0, saturation: 0.05, brightness: 0.10))
                .frame(width: 130, height: 130)
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
