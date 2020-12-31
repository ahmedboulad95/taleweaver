//
//  OutlineView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/29/20.
//

import SwiftUI

struct OutlineView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
            HStack {
                ToolboxView()
                CanvasView()
                InspectorView()
            }
        }
    }
}

struct OutlineView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineView()
    }
}
