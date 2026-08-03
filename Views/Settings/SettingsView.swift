//
//  SettingsView.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import SwiftUI

struct SettingsView: View {

    @State private var notificationsEnabled = true
    @State private var showingAbout = false
    @State private var showingPrivacy = false
    @State private var showingHelp = false
    
    @State private var userViewModel = UserViewModel()
    
    @State private var navigateToLogin = false



    var body: some View {


            ScrollView(showsIndicators: true) {

                VStack(alignment: .leading,
                       spacing: Spacing.xl) {

                    // Header
                    VStack(alignment: .leading,
                           spacing: Spacing.sm) {

                        Text("Settings")
                            .font(Fonts.largeTitle)
                        
                        Divider()
                        

                    }

                    // Profile
                    ProfileCard(
                        name: userViewModel.currentUser.name,
                        email: userViewModel.currentUser.email
                    )

                    // Preferences
                    VStack(alignment: .leading,
                           spacing: Spacing.md) {

                        Text("Preferences")
                            .font(Fonts.headline)

                        VStack(spacing: 0) {

                            ToggleSettingRow(
                                icon: "bell.fill",
                                title: "Notifications",
                                isOn: $notificationsEnabled
                            )

                            Divider()

                            SettingRow(
                                icon: "paintbrush.fill",
                                title: "Appearance",
                                value: "Light"
                            ) {
                                
                               
                            }

                            Divider()

                            SettingRow(
                                icon: "globe",
                                title: "Language",
                                value: "English"
                            ) {

                            }

                        }
                        .padding()
                        .background(Colors.surface)
                        .clipShape(
                            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        )

                    }

                    // Support
                    VStack(alignment: .leading,
                           spacing: Spacing.md) {

                        Text("Support")
                            .font(Fonts.headline)

                        VStack(spacing: 0) {

                            SettingRow(
                                icon: "questionmark.circle",
                                title: "Help Center"
                            ) {
                                
                                showingHelp = true

                            }

                            Divider()

                            SettingRow(
                                icon: "lock.shield",
                                title: "Privacy Policy"
                            ) {
                                showingPrivacy = true

                            }

                            Divider()

                            SettingRow(
                                icon: "info.circle",
                                title: "About Momentum"
                            ) {
                                
                                showingAbout = true

                            }

                        }
                        .padding()
                        .background(Colors.surface)
                        .clipShape(
                            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        )

                    }

                    // Sign Out
                    Button {
                        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
                            navigateToLogin = true
                    } label: {

                        Text("Sign Out")
                            .font(Fonts.headline)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity)
                            .frame(height: Constants.buttonHeight)
                            .overlay(
                                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                                    .stroke(.red, lineWidth: 1.5)
                            )

                    }.navigationDestination(isPresented: $navigateToLogin) {
                        StartView()
                    }
                    

                }//vstack
                .padding()
                .safeAreaPadding(.bottom, 100)

            }//scroll
            .sheet(isPresented: $showingAbout) {

                AboutView()

            }

            .sheet(isPresented: $showingPrivacy) {

                PrivacyPolicyView()

            }

            .sheet(isPresented: $showingHelp) {

                HelpCenterView()

            }
        


    }

}

#Preview {
    SettingsView()
}
