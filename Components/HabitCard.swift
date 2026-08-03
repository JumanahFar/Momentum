//
//  HabitCard.swift
//  Momentum
//
//  Created by Jumana on 24/07/2026.
//

import SwiftUI
struct HabitCard: View {
    
    let title: String
    let subtitle: String
    let streak: Int
    let isCompleted: Bool
    
    var body: some View {
        
        HStack(alignment: .center, spacing: Spacing.md){
            //completion button
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundStyle(isCompleted ? Colors.success : Colors.border)
            
            VStack(alignment: .leading,  spacing: Spacing.xs){
                Text(title)
                    .font(Fonts.headline)
                    .foregroundStyle(Colors.textPrimary)

                Text(subtitle)
                    .font(Fonts.body)
                    .foregroundStyle(Colors.textSecondary)
                
                HStack(spacing: 4) {

                                   Image(systemName: "flame.fill").foregroundStyle(Colors.primary)

                                   Text("\(streak) day streak")
                                       .font(Fonts.caption)
                                       .foregroundStyle(Colors.textSecondary)

                               }
                }
            
            Spacer()
            
        }
        
               .padding()
               .background(Colors.surface)
               .clipShape(
                   RoundedRectangle(
                       cornerRadius: Constants.cornerRadius
                   )
               )
        
    }
}

#Preview {

    VStack(spacing: 16) {

        HabitCard(
            title: "Drink Water",
            subtitle: "2 glasses left",
            streak: 15,
            isCompleted: false
        )

        HabitCard(
            title: "Read",
            subtitle: "20 pages completed",
            streak: 8,
            isCompleted: true
        )

    }.padding()

}
