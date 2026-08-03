//
//  InsightCard.swift
//  Momentum
//
//  Created by Jumana on 26/07/2026.
//
import SwiftUI

struct InsightCard: View {

    let icon: String
    let iconColor: Color

    let value: String
    let unit: String?

    let title: String

    let change: String

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            // Top Row

            HStack {

                Image(systemName: icon)
                    .font(.headline)
                    .foregroundStyle(iconColor)
                    .frame(width: 38, height: 38)
                    .background(iconColor.opacity(0.15))
                    .clipShape(Circle())

                Spacer()

                Text(change)
                    .font(Fonts.caption)
                    .foregroundStyle(Colors.secondary)

            }

            Spacer()

            // Value

            HStack(alignment: .firstTextBaseline, spacing: 4) {

                Text(value)
                    .font(Fonts.body)

                if let unit {

                    Text(unit)
                        .font(Fonts.caption)
                        .foregroundStyle(Colors.textSecondary)

                }

            }

            // Title

            Text(title)
                .font(Fonts.caption)
                .foregroundStyle(Colors.textSecondary)

        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 140)
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

    HStack(spacing: Spacing.md) {

        InsightCard(
            icon: "waveform.path.ecg",
            iconColor: Colors.secondary,
            value: "78%",
            unit: nil,
            title: "Avg. Completion",
            change: "+12%"
        )

        InsightCard(
            icon: "flame.fill",
            iconColor: Colors.primary,
            value: "14",
            unit: "days",
            title: "Current Streak",
            change: "+2"
        )

    }
    .padding()

}
