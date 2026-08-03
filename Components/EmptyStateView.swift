//
//  EmptyStateView.swift
//  Momentum
//
//  Created by Jumana on 27/07/2026.
//
import SwiftUI

struct EmptyStateView: View {

    let action: () -> Void

    var body: some View {

        VStack(spacing: Spacing.xl) {

            Image(systemName: "leaf.fill")
                .font(.system(size: 70))
                .foregroundStyle(Colors.primary)

            VStack(spacing: Spacing.sm) {

                Text("Start your first habit")
                    .font(Fonts.title)

                Text("""
Create your first habit and begin
building momentum today.
""")
                .font(Fonts.body)
                .foregroundStyle(Colors.textSecondary)
                .multilineTextAlignment(.center)

            }


        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 80)

    }

}

#Preview {
    EmptyStateView(action: {})
}
