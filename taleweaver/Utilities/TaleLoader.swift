//
//  TaleLoader.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/3/21.
//

import Foundation

var tale: Tale = TaleLoader.loadTale(name: "tale2")

struct TaleLoader {
    static func loadTale<T: Decodable>(name taleName: String) -> T {
        guard let folder = FileFetcher.getSupportFolder() else {
            fatalError("Couldn't open support folder")
        }
        
        let filename = "\(taleName).json"
        let filePath = "\(folder.path)/taledata/\(filename)"
        let data: Data
        let file = NSURL.fileURL(withPath: filePath)
        
        do {
            data = try Data(contentsOf: file)
        } catch let error {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch let error {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
