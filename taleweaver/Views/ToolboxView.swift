//
//  ToolboxView.swift
//  taleweaver
//
//  Created by Ahmed Boulad on 12/29/20.
//

import SwiftUI

struct ToolboxView: View {
    var body: some View {
        VStack {
            ToolboxElementView()
                .padding()
            ToolboxElementView()
                .padding()
            ToolboxElementView()
                .padding()
            Spacer()
        }
    }
}

struct ToolboxView_Previews: PreviewProvider {
    static var previews: some View {
        ToolboxView()
    }
}
