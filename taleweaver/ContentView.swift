//
//  ContentView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/29/20.
//

import SwiftUI

struct ContentView: View {
    var tale: Tale = TaleLoader.loadTale(name: "tale1")

    var body: some View {
        VStack {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                CharacterListView()
                    .tabItem {
                        Text("Character Index")
                    }.tag(1)
                OutlineView()
                    .tabItem {
                        Text("Outline")
                    }.tag(2)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
