//
//  ChartArea.swift
//  Momentum
//
//  Created by Jumana on 26/07/2026.
//
import SwiftUI
import Charts

struct ChartArea: View {

    let values: [Double]

    private let days = [
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat",
        "Sun"
    ]

    var body: some View {

        Chart {

            ForEach(Array(values.enumerated()),
                    id: \.offset) { index, value in

                LineMark(
                    x: .value("Day", days[index]),
                    y: .value("Value", value)
                ).foregroundStyle(Colors.primary)
                    .interpolationMethod(.catmullRom) // Optional: smoother curve

                AreaMark(
                    x: .value("Day", days[index]),
                    y: .value("Value", value)
                ).foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Colors.primary.opacity(0.3),
                            Colors.primary.opacity(0.05)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ) // Add this for gradient fill

            }

        }
        .chartLegend(.hidden)
        .chartYAxis {
                    AxisMarks { value in
                        AxisGridLine()
                            .foregroundStyle(Colors.border)
                        AxisTick()
                            .foregroundStyle(Colors.border)
                        AxisValueLabel()
                            .foregroundStyle(Colors.textSecondary)
                    }
                }
                .chartXAxis {
                    AxisMarks { value in
                        AxisGridLine()
                            .foregroundStyle(Colors.border)
                        AxisTick()
                            .foregroundStyle(Colors.border)
                        AxisValueLabel()
                            .foregroundStyle(Colors.textSecondary)
                    }
                }

    }

}
