//
//  SurfaceView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/26/21.
//

import SwiftUI

struct SurfaceView: View {
    @ObservedObject var mesh: Mesh
    @ObservedObject var selection: SelectionHandler
    
    @State var portalPosition: CGPoint = .zero
    @State var dragOffset: CGSize = .zero
    @State var isDragging: Bool = false
    @State var isDraggingMesh: Bool = false
    
    @State var zoomScale: CGFloat = 1.0
    @State var initialZoomScale: CGFloat?
    @State var initialPortalPosition: CGPoint?
    
    var body: some View {
        VStack {
            Text("drag offset = w:\(dragOffset.width), h:\(dragOffset.height)")
            Text("portal offset = x:\(portalPosition.x), y:\(portalPosition.y)")
            Text("zoom = \(zoomScale)")
            
            GeometryReader { geometry in
                ZStack {
                    Rectangle().fill(Color.yellow)
                    MapView(selection: self.selection, mesh: self.mesh)
                        .offset(x: self.portalPosition.x + self.dragOffset.width, y: self.portalPosition.y + self.dragOffset.height)
                        .animation(.easeIn)
                }
                .gesture(DragGesture()
                .onChanged { value in
                    self.processDragChange(value, containerSize: geometry.size)
                }
                .onEnded { value in
                    self.processDragEnd(value)
                })
            }
        }
    }
}

struct SurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        let mesh = Mesh.sampleMesh()
        let selection = SelectionHandler()
        return SurfaceView(mesh: mesh, selection: selection)
    }
}

private extension SurfaceView {
    func distance(from pointA: CGPoint, to pointB: CGPoint) -> CGFloat {
        let xdelta = pow(pointA.x - pointB.x, 2)
        let ydelta = pow(pointA.y - pointB.y, 2)
        
        return sqrt(xdelta + ydelta)
    }
    
    func hitTest(point: CGPoint, parent: CGSize) -> Node? {
        for node in mesh.nodes {
            let endPoint = node.position
                .scaledFrom(zoomScale)
                .alignCenterInParent(parent)
                .translatedBy(x: portalPosition.x, y: portalPosition.y)
            let dist = distance(from: point, to: endPoint) / zoomScale
            
            if dist < NodeView.width / 2.0 {
                return node
            }
        }
        return nil
    }
    
    func processNodeTranslation(_ translation: CGSize) {
        guard !selection.draggingNodes.isEmpty else { return }
        let scaledTranslation = translation.scaledDownTo(zoomScale)
        mesh.processNodeTranslation(scaledTranslation, nodes: selection.draggingNodes)
    }
    
    func processDragChange(_ value: DragGesture.Value, containerSize: CGSize) {
        if !isDragging {
            isDragging = true
            if let node = hitTest(point: value.startLocation, parent: containerSize) {
                isDraggingMesh = false
                selection.selectNode(node)
                selection.startDragging(mesh)
            } else {
                isDraggingMesh = true
            }
        }
        
        if isDraggingMesh {
            dragOffset = value.translation
        } else {
            processNodeTranslation(value.translation)
        }
    }
    
    func processDragEnd(_ value: DragGesture.Value) {
        isDragging = false
        dragOffset = .zero
    
        if isDraggingMesh {
            portalPosition = CGPoint(x: portalPosition.x + value.translation.width, y: portalPosition.y + value.translation.height)
        } else {
            processNodeTranslation(value.translation)
            selection.stopDragging(mesh)
        }
    }
}
