//
//  CustomTextField.swift
//  Momentum
//
//  Created by Jumana on 22/07/2026.
//
import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var body: some View {
        TextField(title , text: $text)
            .padding()
            .frame(height: Constants.textFieldHeight)
            .background(Colors.surface)
            .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(Colors.border , lineWidth: 1))
            
    }
}

#Preview {
   @Previewable @State var email = ""
    return CustomTextField( title: "Email" , text: $email).padding()
}
