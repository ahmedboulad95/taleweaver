//
//  Tale.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 1/3/21.
//

import Foundation

struct Tale: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var characters: [Character]
}
