//
//  PrivacyPolicyView.swift
//  Momentum
//
//  Created by Jumana on 28/07/2026.
//

import SwiftUI

struct PrivacyPolicyView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ScrollView {

                Text("""
Momentum stores your habits locally on your device.

No personal data is shared with third parties.

This app does not collect analytics or sell your information.
""")
                .padding()

            }
            .navigationTitle("Privacy Policy")
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
