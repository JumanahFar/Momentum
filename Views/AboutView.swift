//
//  AboutView.swift
//  Momentum
//
//  Created by Jumana on 28/07/2026.
//

import SwiftUI

struct AboutView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: Spacing.lg) {

                    Text("Momentum")
                        .font(Fonts.largeTitle)

                    Text("Version 1.0")

                    Text("""
Momentum helps you build better habits with reminders, streak tracking, and progress insights.

Built with SwiftUI and SwiftData.
""")

                }
                .padding()

            }
            .navigationTitle("About")
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
