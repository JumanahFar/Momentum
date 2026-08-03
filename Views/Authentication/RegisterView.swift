//
//  RegisterView.swift
//  Momentum
//
//  Created by Jumana on 21/07/2026.
//
import SwiftUI

struct RegisterView: View {
    
    @State private var viewModel = RegisterViewModel() // Use the ViewModel
       @State private var navigateToMain = false // For navigation after registration
    @FocusState private var focusedField: Field? // Add focus state
    
    // Define focus fields
        enum Field {
            case fullName, email, password, confirmPassword
        }
    
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
                        Text("Join Momentum")
                            .font(Fonts.title)
                            .foregroundStyle(Colors.textPrimary)
                        
                        // Subtitle
                        Text("Start your journey towards better habits.")
                            .font(Fonts.body)
                            .foregroundStyle(Colors.textSecondary)
                        
                        // Error message
                                                if let error = viewModel.errorMessage {
                                                    Text(error)
                                                        .font(Fonts.caption)
                                                        .foregroundStyle(.red)
                                                        .padding(.horizontal)
                                                }
                                                
                                                // Name
                                                CustomTextField(
                                                    title: "Full Name",
                                                    text: $viewModel.fullName
                                                )
                                                .focused($focusedField, equals: .fullName)
                                                .submitLabel(.next)
                                                .onSubmit {
                                                    focusedField = .email
                                                }
                                                
                                                // Email
                                                CustomTextField(
                                                    title: "Email",
                                                    text: $viewModel.email
                                                )
                                                .focused($focusedField, equals: .email)
                                                .submitLabel(.next)
                                                .onSubmit {
                                                    focusedField = .password
                                                }
                                                .autocapitalization(.none)
                                                .keyboardType(.emailAddress)
                                                
                                                // Password - Use a unique identifier
                                                PasswordField(
                                                    title: "Password",
                                                    password: $viewModel.password
                                                )
                                                .focused($focusedField, equals: .password)
                                                .submitLabel(.next)
                                                .onSubmit {
                                                    focusedField = .confirmPassword
                                                }
                                                
                                                // Confirm Password - Use a unique identifier
                                                PasswordField(
                                                    title: "Confirm Password",
                                                    password: $viewModel.confirmPassword
                                                )
                                                .focused($focusedField, equals: .confirmPassword)
                                                .submitLabel(.done)
                                                .onSubmit {
                                                    viewModel.register()
                                                }
                        Spacer()
                        
                        // Create Account Button
                                              Button {
                                                  viewModel.register()
                                              } label: {
                                                  if viewModel.isLoading {
                                                      ProgressView()
                                                          .tint(.white)
                                                          .frame(width: Constants.buttonWidth)
                                                          .frame(height: Constants.buttonHeight)
                                                          .background(Colors.primary)
                                                          .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
                                                  } else {
                                                      PrimaryButton(title: "Create Account")
                                                  }
                                              }
                                              .disabled(viewModel.isLoading)
                                              .buttonStyle(.plain)
                                              .onChange(of: viewModel.isRegistered) { _, isRegistered in
                                                  if isRegistered {
                                                      navigateToMain = true
                                                  }
                                              }
                        
                        // Login Link
                        NavigationLink {
                            
                            LoginView()
                            
                        } label: {
                            
                            Text("Already have an account? Log In")
                                .font(Fonts.caption)
                            .foregroundStyle(Colors.primary) }
                        
                    }.padding()
                }
                
                
            }//zstack
        }//nav
        .navigationBarBackButtonHidden(true) // ADD THIS
        .navigationDestination(isPresented: $navigateToMain) {
                    MainTabView()
                }
    }
}

#Preview {
    RegisterView()
}
