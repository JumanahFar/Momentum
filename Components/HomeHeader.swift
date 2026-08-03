//
//  HomeHeader.swift
//  Momentum
//
//  Created by Jumana on 24/07/2026.
//
import SwiftUI

struct HomeHeader: View {
    var userName : String
    
    @State private var showNotificationAlert = false
    
    var body: some View {
        
        HStack(alignment: .top){
            
            //profile section
            HStack(spacing: Spacing.md){
                Image(systemName: "person.circle.fill").font(.system(size:44)).foregroundStyle(Colors.primary)
                
                VStack(alignment: .leading, spacing: Spacing.xs){
                    Text("Hello , ").font(Fonts.body).foregroundStyle(Colors.textSecondary)
                    Text(userName).font(Fonts.headline).foregroundStyle(Colors.textPrimary)
                }
            }
            
            
            Spacer()
            //Right buttons
            HStack(spacing: Spacing.sm){
                Button{
                    showNotificationAlert = true
                } label:{ Image(systemName: "bell")}
                
                    .buttonStyle(.bordered)
                    .alert("Notifications", isPresented: $showNotificationAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("Your reminders are set. You'll receive notifications at your scheduled times.")
                    }
                
               
                
                
                
            }
            
        }
    }
}

#Preview{
    HomeHeader(userName: "Jumanah").padding()
}
