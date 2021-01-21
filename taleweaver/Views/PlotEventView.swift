//
//  PlotEventView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/20/21.
//

import SwiftUI

struct PlotEventView: View {
    var event: PlotEvent

    init(event: PlotEvent) {
        self.event = event
    }
    
    var body: some View {
        VStack {
            event.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 1080, height: 566)
                .padding()
            CharacterGridView(characters: self.event.characters)
                .padding()
            Text(self.event.description)
                .padding()
            Spacer()
        }
    }
}

struct PlotEventView_Previews: PreviewProvider {
    static var previews: some View {
        PlotEventView(event: tale!.events[0])
    }
}
