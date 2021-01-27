//
//  EdgeView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/26/21.
//

import SwiftUI

struct EdgeView: Shape {
    var startx: CGFloat = 0
    var starty: CGFloat = 0
    var endx: CGFloat = 0
    var endy: CGFloat = 0
    
    init(edge: EdgeProxy) {
        startx = edge.start.x
        starty = edge.start.y
        endx = edge.end.x
        endy = edge.end.y
    }
    
    func path(in rect: CGRect) -> Path {
        var linkPath = Path()
        linkPath.move(to: CGPoint(x: startx, y: starty)
                        .alignCenterInParent(rect.size))
        linkPath.addLine(to: CGPoint(x: endx, y: endy)
                            .alignCenterInParent(rect.size))
        return linkPath
    }
}

struct EdgeView_Previews: PreviewProvider {
    static var previews: some View {
        let edge1 = EdgeProxy(id: UUID(), start: CGPoint(x: -100, y: -100), end: CGPoint(x: 100, y: 100))
        let edge2 = EdgeProxy(id: UUID(), start: CGPoint(x: 100, y: -100), end: CGPoint(x: -100, y: 100))
        return ZStack {
            EdgeView(edge: edge1).stroke(lineWidth: 4)
            EdgeView(edge: edge2).stroke(Color.blue, lineWidth: 2)
        }
    }
}
