//
//  HelpCenterView.swift
//  Momentum
//
//  Created by Jumana on 28/07/2026.
//

import SwiftUI

struct HelpCenterView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: Spacing.lg) {

                    Text("Need Help?")
                        .font(Fonts.title)

                    Text("""
• Create habits from the Home screen.

• Tap a habit to view details.

• Mark habits complete daily to build your streak.

• Enable reminders from Add Habit.
""")

                }
                .padding()

            }
            .navigationTitle("Help")
            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button("Done") {

                        dismiss()

                    }

                }

            }

        }

    }

}
