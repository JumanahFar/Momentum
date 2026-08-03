//
//  StatisticsView.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import SwiftUI
import SwiftData

struct StatisticsView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    @State private var viewModel = StatisticsViewModel()
    @State private var selectedHabit: Habit?
    @State private var showingHabitDetail = false
    
    var body: some View {
            ScrollView(showsIndicators: true) {
                VStack(alignment: .leading, spacing: Spacing.xl) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        Text("Insights")
                            .font(Fonts.largeTitle)
                        
                        Text("Your journey to consistency")
                            .font(Fonts.body)
                            .foregroundStyle(Colors.textSecondary)
                    }
                    
                    // Stats Cards
                    HStack(spacing: Spacing.md) {
                        InsightCard(
                            icon: "waveform.path.ecg",
                            iconColor: Colors.secondary,
                            value: viewModel.totalHabits == 0 ? "0%" : "\(viewModel.completionRate)%",
                            unit: nil,
                            title: "Avg. Completion",
                            change: viewModel.totalHabits == 0 ? "+0%" : "+\(viewModel.completionRate)%"
                        )
                        
                        InsightCard(
                            icon: "flame.fill",
                            iconColor: Colors.primary,
                            value: "\(viewModel.bestStreak)",
                            unit: "days",
                            title: "Best Streak",
                            change: viewModel.bestStreak > 0 ? "🔥" : ""
                        )
                    }
                    
                    // Trend Chart
                    TrendChart(values: viewModel.weeklyData)
                    
                    // Weekly Highlights with actions
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        Text("Weekly Highlights")
                            .font(Fonts.headline)
                        
                        ForEach(viewModel.highlights) { highlight in
                            HighlightRow(
                                icon: highlight.icon,
                                iconColor: highlight.iconColor,
                                title: highlight.title,
                                subtitle: highlight.subtitle,
                                action: {
                                    // Handle tap
                                    print("Tapped: \(highlight.title)")
                                    // You can add navigation or show details here
                                }
                            )
                        }
                    }
                    // ADD THIS - Extra space at bottom so content doesn't hide behind bottom nav
                                        Color.clear
                                            .frame(height: 20)
                }
                .padding()
            }
        .background(Colors.background)
        .onAppear {
            viewModel.fetchHabits(context: modelContext)
        }
        .onChange(of: modelContext) { _, _ in
            viewModel.fetchHabits(context: modelContext)
        }
    }
}


#Preview {
    StatisticsView()
}
