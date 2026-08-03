//
//  StartView.swift
//  Momentum
//
//  Created by Jumana on 21/07/2026.
//
import SwiftUI
struct StartView: View {
    // Every SwiftUI View must have a body and The body returns a View it can be img vid txt btn
    var body: some View{
        NavigationStack{
            
            ZStack{
                Colors.background.ignoresSafeArea()
            
            
                VStack(spacing: Spacing.md){
                Spacer()
                
                Image("Momentum_logo").resizable().scaledToFit().frame(width:Constants.logoWidth)
                Text("Build lasting routines with clarity and focus.")
                    .font(Fonts.body)
                    .foregroundStyle(Colors.textSecondary)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    
                   
                
                    NavigationLink {
                        OnboardingView()
                    } label: {
                    PrimaryButton(title: "Get Started")
                    }.buttonStyle(.plain) // Add this to fix button styling
                
                    
                
                    NavigationLink {
                        LoginView()
                    }label:{
                    Text("Already have an account? Log In")
                        .font(Fonts.caption)
                        .foregroundStyle(Colors.primary)
                }
            }.padding(.top , Spacing.md)
            
            }//ZStack
            
        }//nav
    
    }
}

#Preview {
    StartView()
}
