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
            ImagePickerView()
            TextField("First Name", text: $character.firstName)
            TextField("Last Name", text: $character.lastName)
        }
    }
}

struct AddCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        AddCharacterView()
    }
}
