//
//  ImagePickerView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/31/20.
//

import SwiftUI
import AppKit

struct ImagePickerView: View {
    var body: some View {
        Button("Select File") {
            let openPanel = NSOpenPanel()
            openPanel.prompt = "Select File"
            openPanel.allowsMultipleSelection = false
            openPanel.canChooseDirectories = false
            openPanel.canChooseFiles = true
            openPanel.allowedFileTypes = ["png", "jpg", "jpeg"]
            openPanel.begin { (result) -> Void in
                if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    let sourceUrl = openPanel.url!
                    let imageData = try? Data(contentsOf: sourceUrl)
                    let filename = (sourceUrl.path as NSString).lastPathComponent

                    let supportFolder = FileFetcher.getSupportFolder()
                    
                    if let fullDestPath = supportFolder?.appendingPathComponent(filename), let data = imageData {
                        do {
                            print("Destination Path :: \(fullDestPath.path)")
                            try data.write(to: fullDestPath, options: .atomic)
                            
                            let newCharacter = Character(firstName: "Mr", lastName: "Meeseeks", age: 100, imageName: filename)
                            FileFetcher.addCharacter(newCharacter: newCharacter)
                        } catch let error {
                            print("Error :: \(error)")
                        }
                    }
                }
            }
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
