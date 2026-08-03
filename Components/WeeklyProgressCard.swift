//
//  WeeklyProgressCard.swift
//  Momentum
//
//  Created by Jumana on 25/07/2026.
//
import SwiftUI

struct WeeklyProgressCard: View {

    let completedDays: [Bool]

    let weekRange: String

    private let weekLetters = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.lg) {

            HStack {

                Text("This Week")
                    .font(Fonts.headline)

                Spacer()

                Label(weekRange, systemImage: "calendar")
                    .font(Fonts.caption)
                    .foregroundStyle(Colors.textSecondary)

            }

            HStack(spacing: Spacing.md) {

                ForEach(0..<7, id: \.self) { index in

                    VStack(spacing: Spacing.sm) {

                        Text(weekLetters[index])
                            .font(Fonts.caption)
                            .foregroundStyle(Colors.textSecondary)

                        Circle()
                            .fill(
                                completedDays[index]
                                ? Colors.primary
                                : Color(.systemGray5)
                            )
                            .frame(width: 38, height: 38)
                            .overlay {

                                if completedDays[index] {

                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .font(.caption)

                                }

                            }

                    }

                }

            }

        }
        .padding()
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

    WeeklyProgressCard(
        completedDays: [
            true,
            true,
            false,
            true,
            true,
            true,
            true
        ],
        weekRange: "May 12 - 18"
    )
    .padding()

}
