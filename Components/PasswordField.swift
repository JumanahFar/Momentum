//
//  PasswordField.swift
//  Momentum
//
//  Created by Jumana on 21/07/2026.
//
import SwiftUI

struct PasswordField: View{
    let title: String
    @Binding var password: String
    
    @State private var isSecure = true
    
    var body: some View{
        HStack{
            if isSecure{
                SecureField(title , text: $password)
                    .textContentType(.password) // Add this
                    .autocorrectionDisabled() // Add this
                    .textInputAutocapitalization(.never)
            }else{
                TextField(title , text: $password)
                    .textContentType(.password) // Add this
                    .autocorrectionDisabled() // Add this
                    .textInputAutocapitalization(.never)
            }
            
            Button{
                isSecure.toggle()
            } label: {
                Image(systemName: isSecure ? "eye.slash" : "eye").foregroundStyle(Colors.textSecondary)
            }
        }.padding()
            .frame(height: Constants.textFieldHeight)
            .background(Colors.surface)
            .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(Colors.border , lineWidth: 1))
    }
    
}

#Preview {
    @Previewable @State var password = ""

    return PasswordField(
        title: "Password",
        password: $password
    )
    .padding()
}
