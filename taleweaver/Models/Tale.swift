//
//  Tale.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/3/21.
//

import Foundation

class Tale: Codable, ObservableObject {
    var id: Int
    var name: String
    @Published var characters: [Character]
    @Published var events: [PlotEvent]
    
    enum CodingKeys: CodingKey {
        case id, name, characters, events
    }
    
    init() {
        id = 0
        name = ""
        characters = [Character]()
        events = [PlotEvent]()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        characters = try container.decode([Character].self, forKey: .characters)
        events = try container.decode([PlotEvent].self, forKey: .events)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(characters, forKey: .characters)
        try container.encode(events, forKey: .events)
    }
}
