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
    var age: Int?
    
    var imageName: String?
    var image: Image {
        let supportFolder = FileFetcher.getSupportFolder()
        if let folder = supportFolder {
            if let image = NSImage(byReferencingFile: "\(folder.path)/\(imageName!)") {
                if image.isValid {
                    return Image(nsImage: image)
                }
            }
        }
        
        return Image("default_character_portrait")
    }
    
    init() {
        self.id = (tale != nil) ? tale!.characters[tale!.characters.count-1].id + 1 : 1
        self.firstName = ""
        self.lastName = ""
        self.imageName = ""
    }
    
    init(firstName: String, lastName: String, age: Int, imageName: String) {
        self.id = (tale != nil) ? tale!.characters[tale!.characters.count-1].id + 1 : 1
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.imageName = imageName
    }
    
    func getName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    func getAge() -> Int? {
        return self.age
    }
}
