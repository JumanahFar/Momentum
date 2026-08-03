//
//  ProgressCard.swift
//  Momentum
//
//  Created by Jumana on 24/07/2026.
//
import SwiftUI

struct ProgressCard: View {

    let completedHabits: Int
    let totalHabits: Int

    var progress: Double {
        guard totalHabits > 0 else { return 0 }
        return Double(completedHabits) / Double(totalHabits)
    }

    var percentage: Int {
        Int(progress * 100)
    }

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            Text("Daily Goal")
                .font(Fonts.body)
                .foregroundStyle(.white.opacity(0.9))

            HStack {

                Text("\(completedHabits)/\(totalHabits) habits")
                    .font(Fonts.title)

                Spacer()

                Text("\(percentage)%")
                    .font(Fonts.title)

            }
            .foregroundStyle(.white)

            ProgressView(value: progress)
                .tint(.white)

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Colors.primary)
        .clipShape(
            RoundedRectangle(
                cornerRadius: Constants.cornerRadius
            )
        )

    }
}

#Preview {
    ProgressCard(
        completedHabits: 1,
        totalHabits: 4
    )
    .padding()
}
