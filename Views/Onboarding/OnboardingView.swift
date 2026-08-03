//
//  OnboardingView.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//

import SwiftUI
struct OnboardingView: View {

    var body: some View{
        NavigationStack{
            
        
        ZStack{
            Colors.background.ignoresSafeArea()
            
            VStack{
                Spacer()
                // Illustration
                Image("onboarding_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)
                
                
                // Title
                Text("Build Better Habits")
                    .font(Fonts.title)
                    .foregroundStyle(Colors.textPrimary)
                    .multilineTextAlignment(.center)
                
                
                // Description
                Text("Track your progress, stay motivated, and achieve your goals one habit at a time.")
                    .font(Fonts.body)
                    .foregroundStyle(Colors.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                //Next Button
                NavigationLink {
                    RegisterView()
                } label: {
                    PrimaryButton(title: "Next")
                } .buttonStyle(.plain) // ADD THIS
                
            }.padding()//vstack
        }//zstack
        .navigationBarBackButtonHidden(true) // ADD THIS
      }//nav
    }
}

#Preview{
    OnboardingView()
}
