//
//  HighlightRow.swift
//  Momentum
//
//  Created by Jumana on 26/07/2026.
//
import SwiftUI

struct HighlightRow: View {

    let icon: String
    let iconColor: Color

    let title: String
    let subtitle: String
    
    var action: (() -> Void)? = nil

    var body: some View {
        
        Button{
            action?()
        }label: {
            HStack(spacing: Spacing.md) {

                // Icon

                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(iconColor)
                    .frame(width: 30, height: 30)
                    .background(iconColor.opacity(0.15))
                    .clipShape(Circle())

                // Text

                VStack(alignment: .leading, spacing: 4) {

                    Text(title)
                        .font(Fonts.body)
                        .foregroundStyle(Colors.textPrimary)

                    Text(subtitle)
                        .font(Fonts.caption)
                        .foregroundStyle(Colors.textSecondary)

                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Colors.textSecondary)

            }//hstack
            .padding()
            .background(Colors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(Colors.border, lineWidth: 1)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
            )
        }//label

       

    }

}


#Preview {

    VStack(spacing: 12) {

        HighlightRow(
            icon: "arrow.up.right",
            iconColor: Colors.secondary,
            title: "Rising Momentum",
            subtitle: "Your completion rate is 15% higher than last month."
        )

        HighlightRow(
            icon: "calendar",
            iconColor: .gray,
            title: "Best Day: Wednesday",
            subtitle: "You typically complete 95% of habits mid-week."
        )

        HighlightRow(
            icon: "checkmark.circle",
            iconColor: Colors.secondary,
            title: "Top Habit",
            subtitle: "Morning Meditation has been 75% consistent."
        )

    }
    .padding()

}
