//
//  ImageLoader.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/20/21.
//

import Foundation
import SwiftUI

struct ImageLoader {
    static func loadFromSupportDir(path: String?) -> Image {
        let supportFolder = FileFetcher.getSupportFolder()
        if let imagePath = path {
            if let folder = supportFolder {
                if let image = NSImage(byReferencingFile: "\(folder.path)/\(imagePath)") {
                    if image.isValid {
                        return Image(nsImage: image)
                    }
                }
            }
        }
        
        return Image("empty_image")
    }
}
