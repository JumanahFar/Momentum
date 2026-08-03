//
//  TrendChart.swift
//  Momentum
//
//  Created by Jumana on 26/07/2026.
//

import SwiftUI

struct TrendChart: View {

    let values: [Double]

    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.md) {

            HStack {

                VStack(alignment: .leading) {

                    Text("Completion Trend")
                        .font(Fonts.headline)

                    Text("Last 7 days performance")
                        .font(Fonts.caption)
                        .foregroundStyle(Colors.textSecondary)

                }

                Spacer()

                Text("Weekly")
                    .font(Fonts.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Colors.secondary.opacity(0.2))
                    .foregroundStyle(Colors.secondary)
                    .clipShape(Capsule())

            }

            ChartArea(values: values)
                .frame(height: 100)
                

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

    TrendChart(
        values: [60,45,75,72,85,63,78]
    )
    .padding()

}
