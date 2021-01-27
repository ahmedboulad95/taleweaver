//
//  OutlineView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/29/20.
//

import SwiftUI

struct OutlineView: View {
    var body: some View {
        /*VStack {
            HStack {
                PlotEventView(event: tale!.events[0])
            }
        }*/
        
        /*NavigationView {
            VStack {
                List(tale!.events) { event in
                    NavigationLink(destination: PlotEventView(event: event)) {
                        event.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 80)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Events")*/
        
        let mesh = Mesh.sampleMesh()
        let selection = SelectionHandler()
        return SurfaceView(mesh: mesh, selection: selection)
    }
}

struct OutlineView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineView()
    }
}
