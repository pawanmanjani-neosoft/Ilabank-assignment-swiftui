//
//  SearchbarView.swift
//  TestAppSwiftUI
//
//  Created by NeoSOFT on 27/06/24.
//

import SwiftUI

struct SearchbarView: View {
    @Binding var text: String
    @State private var isEditing = false
    @FocusState private var focusedField: Bool
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .padding(.horizontal, 10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .focused($focusedField)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    focusedField.toggle()
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}
