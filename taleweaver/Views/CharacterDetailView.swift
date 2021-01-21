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
                .frame(width: 400, height: 400)
                .padding()
            Text(character.getName())
            Text("Age: \(String(character.getAge() ?? 0))")
            Spacer()
            HStack {
                Spacer()
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: tale!.characters[0])
    }
}
