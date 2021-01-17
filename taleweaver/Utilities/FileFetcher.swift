//
//  FileFetcher.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/1/21.
//

import Foundation

struct FileFetcher {
    static func getSupportFolder() -> URL? {
        return try? FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    static func addCharacter(newCharacter: Character) {
        guard let currentTale = tale else {
            fatalError("No tale set")
        }
        
        currentTale.characters.append(newCharacter)
        
        do {
            let talePath = "taledata/\(currentTale.name).json"
            guard let folder = FileFetcher.getSupportFolder() else {
                fatalError("Couldn't get support folder")
            }
            
            let filePath = "\(folder.path)/\(talePath)"
            let file = NSURL.fileURL(withPath: filePath)
            
            let encoder = JSONEncoder()
            try encoder.encode(currentTale).write(to: file)
            
            for character in currentTale.characters {
                print("\(character.firstName) \(character.lastName)")
            }
        } catch let error {
            print("Error :: \(error)")
        }
    }
}
