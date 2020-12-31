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
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    func getName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    func getAge() -> Int {
        return self.age
    }
}
