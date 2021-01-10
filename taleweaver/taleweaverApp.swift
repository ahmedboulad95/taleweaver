//
//  taleweaverApp.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/29/20.
//

import SwiftUI

var tale: Tale?

@main
struct taleweaverApp: App {
    init() {
        tale = TaleLoader.loadTale(name: "tale2")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
