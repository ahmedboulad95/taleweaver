//
//  character.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/29/20.
//

import Foundation
import SwiftUI

struct Character: Hashable, Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var age: Int
    
    var imageName: String
    var image: Image {
        let supportFolder = FileFetcher.getSupportFolder()
        if let folder = supportFolder {
            let img = NSImage(byReferencingFile: "\(folder.path)/\(imageName)")
            if let image = img {
                return Image(nsImage: image)
            }
        }
        
        return Image("default_character_portrait")
    }
    
    init() {
        self.id = characters[characters.count-1].id + 1
        self.firstName = ""
        self.lastName = ""
        self.age = -1
        self.imageName = ""
    }
    
    init(firstName: String, lastName: String, age: Int, imageName: String) {
        self.id = characters[characters.count-1].id + 1
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.imageName = imageName
    }
    
    func getName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    func getAge() -> Int {
        return self.age
    }
}
