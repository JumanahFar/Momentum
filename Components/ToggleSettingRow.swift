//
//  ToggleSettingRow.swift
//  Momentum
//
//  Created by Jumana on 24/07/2026.
//
import SwiftUI

struct ToggleSettingRow: View {

    let icon: String
    let title: String

    @Binding var isOn: Bool

    var body: some View {

        HStack {

            Image(systemName: icon)
                .foregroundStyle(Colors.textSecondary)
                .frame(width: 24)

            Text(title)
                .font(Fonts.body)
                .foregroundStyle(Colors.textPrimary)

            Spacer()

            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(Colors.primary)

        }
        .padding(.vertical, Spacing.md)

    }
}

#Preview {

    @Previewable @State var reminderOn = true

    VStack {

        ToggleSettingRow(
            icon: "bell",
            title: "Reminders",
            isOn: $reminderOn
        )

    }
    .padding()

}
