//
//  StatisticCard.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//

import SwiftUI

struct StatisticCard: View {

    let icon: String
    let iconBackground: Color

    let title: String
    let value: String

    var subtitle: String? = nil

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(iconBackground)
                .frame(width: 44, height: 44)
                .background(iconBackground.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(title)
                .font(Fonts.caption)
                .foregroundStyle(Colors.textSecondary)

            Text(value)
                .font(Fonts.caption)
                .foregroundStyle(Colors.textPrimary)

            if let subtitle {

                Text(subtitle)
                    .font(Fonts.caption)
                    .foregroundStyle(.green)

            }

            Spacer()

        }
        .padding()
        .frame(width: 125, height: 200)
        .background(Colors.surface)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(Colors.border, lineWidth: 1)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
        )

    }

}

#Preview {

    HStack {

        StatisticCard(
            icon: "flame.fill",
            iconBackground: Colors.primary,
            title: "Current Streak",
            value: "12 Days",
            subtitle: "+2 today"
        )

        StatisticCard(
            icon: "trophy",
            iconBackground: Colors.secondary,
            title: "Best Streak",
            value: "28 Days"
        )

        StatisticCard(
            icon: "target",
            iconBackground: .gray,
            title: "Consistency",
            value: "94%"
        )

    }
    .padding()

}
