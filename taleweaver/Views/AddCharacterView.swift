//
//  AddCharacterView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/31/20.
//

import SwiftUI

struct AddCharacterView: View {
    @State var character: Character = Character()
    
    var body: some View {
        VStack {
            ImagePickerView(fileSelectHandler: handleImageSelect, character: self.character)
            TextField("First Name", text: $character.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize()
            TextField("Last Name", text: $character.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize()
            TextField("Age", value: $character.age, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize()
            Spacer()
            Button(action: createNewCharacter) {
                Text("+")
                    .font(.system(.largeTitle))
                    .frame(width: 47, height:40)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 7)
            }
            .buttonStyle(PlainButtonStyle())
            .background(Color.blue)
            .cornerRadius(38.5)
            .padding()
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
        }
    }
    
    func handleImageSelect(result: NSApplication.ModalResponse?, openPanel: NSOpenPanel?) {
        if let response = result {
            if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                if let panel = openPanel {
                    let sourceUrl = panel.url!
                    let filename = (sourceUrl.path as NSString).lastPathComponent
                    
                    setCharacterImagePath(imagePath: filename)
                    copyImageToSupportFolder(fileUrl: sourceUrl)
                }
            }
        }
    }
    
    func setCharacterImagePath(imagePath: String) {
        self.character.imageName = imagePath
    }
    
    func copyImageToSupportFolder(fileUrl: URL) {
        let imageData = try? Data(contentsOf: fileUrl)
        let supportFolder = FileFetcher.getSupportFolder()
        let filename = (fileUrl.path as NSString).lastPathComponent
        
        if let fullDestPath = supportFolder?.appendingPathComponent(filename), let data = imageData {
            do {
                print("Destination Path :: \(fullDestPath.path)")
                try data.write(to: fullDestPath, options: .atomic)
            } catch let error {
                print("Error :: \(error)")
            }
        }
    }
    
    func createNewCharacter() {
        FileFetcher.addCharacter(newCharacter: self.character)
        self.character = Character()
    }
}

struct AddCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        AddCharacterView()
    }
}
