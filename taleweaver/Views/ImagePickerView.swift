//
//  ImagePickerView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/31/20.
//

import SwiftUI
import AppKit

struct ImagePickerView: View {
    var fileSelectHandler: (NSApplication.ModalResponse?, NSOpenPanel?) -> Void
    var character: Character?
    
    var body: some View {
        Button(action: {
            let openPanel = NSOpenPanel()
            openPanel.prompt = "Select File"
            openPanel.allowsMultipleSelection = false
            openPanel.canChooseDirectories = false
            openPanel.canChooseFiles = true
            openPanel.allowedFileTypes = ["png", "jpg", "jpeg"]
            openPanel.begin(completionHandler: {result in
                self.fileSelectHandler(result, openPanel)
            })
        }) {
            if let newCharacter = character {
                newCharacter.image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 400, height: 400, alignment: .center)
            } else {
                Image("default_character_portrait")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 400, height: 400, alignment: .center)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 400, height: 400, alignment: .center)
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView { _,_ in
            
        }
    }
}
