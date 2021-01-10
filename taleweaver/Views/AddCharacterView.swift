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
    
    func createNewCharacter() {
        
    }
}

struct AddCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        AddCharacterView()
    }
}
