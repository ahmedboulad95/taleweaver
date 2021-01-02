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
        characters.append(newCharacter)
        
        do {
            let filename = "characterData.json"
            guard let folder = FileFetcher.getSupportFolder() else {
                fatalError("Couldn't get support folder")
            }
            
            let filePath = "\(folder.path)/\(filename)"
            let file = NSURL.fileURL(withPath: filePath)
            
            let encoder = JSONEncoder()
            try encoder.encode(characters).write(to: file)
        } catch let error {
            print("Error :: \(error)")
        }
    }
}
