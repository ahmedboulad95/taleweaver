//
//  EdgeMapView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/26/21.
//

import SwiftUI

struct EdgeMapView: View {
    @Binding var edges: [EdgeProxy]
    
    var body: some View {
        ZStack {
            ForEach(edges) { edge in
                EdgeView(edge: edge)
                    .stroke(Color.black, lineWidth: 3.0)
            }
        }
    }
}

struct EdgeMapView_Previews: PreviewProvider {
    static let proxy1 = EdgeProxy(id: EdgeID(), start: .zero, end: CGPoint(x: -100, y: 30))
    static let proxy2 = EdgeProxy(id: EdgeID(), start: .zero, end: CGPoint(x: 100, y: 30))
    @State static var edges = [proxy1, proxy2]
    
    static var previews: some View {
        EdgeMapView(edges: $edges)
    }
}
