//
//  ModelData.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/30/20.
//

import Foundation

var characters: [Character] = load("characterData.json")

func load<T: Decodable>(_ filename: String) -> T {
    guard let folder = FileFetcher.getSupportFolder() else {
        fatalError("Couldn't open support folder")
    }
    
    let filePath = "\(folder.path)/\(filename)"
    
    let data: Data
    
    let file = NSURL.fileURL(withPath: filePath)
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
