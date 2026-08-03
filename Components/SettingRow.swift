//
//  SettingRow.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//

import SwiftUI

struct SettingRow: View {

    let icon: String
    let title: String
    var value: String? = nil
    var action: (()-> Void)? = nil

    var body: some View {

        Button{
            action?()
        }label:{
            HStack {

                Image(systemName: icon)
                    .foregroundStyle(Colors.textSecondary)
                    .frame(width: 24)

                Text(title)
                    .font(Fonts.body)
                    .foregroundStyle(Colors.textPrimary)

                Spacer()

                if let value {

                    Text(value)
                        .font(Fonts.body)
                        .foregroundStyle(Colors.textSecondary)

                    if action != nil {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                        .foregroundStyle(Colors.textSecondary)}
                }

            }
            .padding(.vertical, Spacing.md)

        }.buttonStyle(.plain)
       
    }
}

#Preview {

    VStack {

        SettingRow(
            icon: "calendar",
            title: "Frequency",
            value: "Daily"
        )

        Divider()

        SettingRow(
            icon: "clock",
            title: "Time of Day",
            value: "08:00 AM"
        )

    }
    .padding()

}
