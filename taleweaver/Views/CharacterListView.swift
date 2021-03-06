//
//  CharacterListView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/30/20.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var currentTale: Tale = Tale()
    
    init() {
        if let currentTale = tale {
            self.currentTale = currentTale
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    NavigationLink(destination: AddCharacterView()) {
                        Image(systemName: "plus")
                            .resizable()
                            .padding(6)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    List(self.currentTale.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterTileView(character: character)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
