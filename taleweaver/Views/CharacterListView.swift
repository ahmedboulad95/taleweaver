//
//  CharacterListView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/30/20.
//

import SwiftUI

struct CharacterListView: View {
    @State private var showDetail = false
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            List(characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    CharacterTileView(character: character)
                }
                .frame(alignment: .center)
            }
        }
        .navigationTitle("Characters")
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
