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
                    let filename = (sourceUrl.path as NSString).lastPathComponent
                    let destUrl = NSURL.fileURL(withPath: "/Volumes/RAVPOWER /Projects/taleweaver/taleweaver/Resources/img/\(filename)")
                    do {
                        print(String(destUrl.startAccessingSecurityScopedResource()))
                        if sourceUrl.startAccessingSecurityScopedResource() {
                            try FileManager.default.copyItem(at: sourceUrl, to: destUrl)
                            sourceUrl.stopAccessingSecurityScopedResource()
                        } else {
                            print("Not accessing \(sourceUrl.path)")
                        }
                        
                    } catch (let error) {
                        print("Cannot copy item at \(sourceUrl.path) to \(destUrl.path): \(error)")
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
