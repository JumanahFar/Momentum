//
//  ProfileCard.swift
//  Momentum
//
//  Created by Jumana on 26/07/2026.
//
import SwiftUI

struct ProfileCard: View {

    let name: String
    let email: String

    var body: some View {

        HStack(spacing: Spacing.md) {

            Circle()
                .fill(Colors.primary.opacity(0.2))
                .frame(width: 70, height: 70)
                .overlay {

                    Image(systemName: "person.fill")
                        .font(.title)
                        .foregroundStyle(Colors.primary)

                }

            VStack(alignment: .leading,
                   spacing: 4) {

                Text(name)
                    .font(Fonts.headline)

                Text(email)
                    .font(Fonts.body)
                    .foregroundStyle(Colors.textSecondary)

            }

            Spacer()

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
