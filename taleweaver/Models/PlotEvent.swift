//
//  PlotEvent.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/20/21.
//

import Foundation
import SwiftUI

struct PlotEvent: Hashable, Codable, Identifiable {
    var id: Int
    var characters: [Character] = []
    var description: String = ""
    
    var imageName: String?
    var image: Image {
        return ImageLoader.loadFromSupportDir(path: self.imageName)
    }
    
    init() {
        self.id = 0
    }
}
