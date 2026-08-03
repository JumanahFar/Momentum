//
//  LoginView.swift
//  Momentum
//
//  Created by Jumana on 21/07/2026.
//

import SwiftUI

struct LoginView: View {

    
    @State private var viewModel = LoginViewModel() // Use the ViewModel
    @State private var navigateToMain = false // For navigation after login
    
    var body: some View {
        NavigationStack{
            
            
            ZStack{
                Colors.background.ignoresSafeArea()
                ScrollView{
                    VStack(spacing: Spacing.md){
                        
                        Spacer()
                        
                        Image("Momentum_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180)
                        // Title
                        Text("Welcome Back")
                            .font(Fonts.title)
                            .foregroundStyle(Colors.textPrimary)
                        
                        // Subtitle
                        Text("Log in to continue building your habits.")
                            .font(Fonts.body)
                            .foregroundStyle(Colors.textSecondary)
                        Spacer()
                        
                        // Error message
                                                if let error = viewModel.errorMessage {
                                                    Text(error)
                                                        .font(Fonts.caption)
                                                        .foregroundStyle(.red)
                                                        .padding(.horizontal)
                                                }
                                                
                                                // Email - binding to ViewModel
                                                CustomTextField(
                                                    title: "Email",
                                                    text: $viewModel.email // Changed from $Email
                                                )
                                                
                                                // Password - binding to ViewModel
                                                PasswordField(
                                                    title: "Password",
                                                    password: $viewModel.password // Changed from $Password
                                                )
                        
                        Spacer()
                        
                        // Login Button - Using ViewModel
                                               Button {
                                                   viewModel.login()
                                               } label: {
                                                   if viewModel.isLoading {
                                                       ProgressView()
                                                           .tint(.white)
                                                           .frame(width: Constants.buttonWidth)
                                                           .frame(height: Constants.buttonHeight)
                                                           .background(Colors.primary)
                                                           .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
                                                   } else {
                                                       PrimaryButton(title: "Log In")
                                                   }
                                               }
                                               .disabled(viewModel.isLoading)
                                               .buttonStyle(.plain)
                                               .onChange(of: viewModel.isAuthenticated) { _, isAuthenticated in
                                                   if isAuthenticated {
                                                       navigateToMain = true
                                                   }
                                               }
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("Don't have an account? Sign Up")
                                .font(Fonts.caption)
                                .foregroundStyle(Colors.primary)
                        }
                    }
                }
            }
            
            
            
            
        }
        .navigationBarBackButtonHidden(true) // ADD THIS
        .navigationDestination(isPresented: $navigateToMain) {
                        MainTabView()
                    }
    }
}

#Preview {
    LoginView()
}
