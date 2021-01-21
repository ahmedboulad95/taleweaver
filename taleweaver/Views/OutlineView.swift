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
            HStack {
                /*ToolboxView()
                CanvasView()
                InspectorView()*/
                PlotEventView(event: tale!.events[0])
            }
        }
    }
}

struct OutlineView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineView()
    }
}
