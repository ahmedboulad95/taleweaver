//
//  CharacterDetailView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/30/20.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        VStack {
            character.image
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            Text(character.getName())
                .foregroundColor(Color.white)
            Text("Age: \(String(character.getAge()))")
                .foregroundColor(Color.white)
            Spacer()
            HStack {
                Spacer()
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: characters[0])
    }
}
