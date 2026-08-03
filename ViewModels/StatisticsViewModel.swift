//
//  StatisticsViewModel.swift
//  Momentum
//
//  Created by Jumana on 30/07/2026.
//
import Foundation
import SwiftData
import Observation

@Observable
class StatisticsViewModel {
    
    private var habits: [Habit] = []
    
    // Computed properties for statistics
    var completionRate: Int {
        guard !habits.isEmpty else { return 0 }
        
        let today = Calendar.current.startOfDay(for: Date())
        let completedToday = habits.filter { habit in
            habit.completedDates.contains { date in
                Calendar.current.isDate(date, inSameDayAs: today)
            }
        }.count
        
        return Int((Double(completedToday) / Double(habits.count)) * 100)
    }
    
    var bestStreak: Int {
        habits.map { StreakCalculator.currentStreak(for: $0) }.max() ?? 0
    }
    
    var totalCompletions: Int {
        habits.reduce(0) { $0 + $1.completedDates.count }
    }
    
    var totalHabits: Int {
        habits.count
    }
    
    var weeklyData: [Double] {
        guard !habits.isEmpty else {
            return [0, 0, 0, 0, 0, 0, 0]
        }
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        guard let startOfWeek = calendar.date(
            from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        ) else {
            return [0, 0, 0, 0, 0, 0, 0]
        }
        
        return (0..<7).map { offset in
            guard let day = calendar.date(byAdding: .day, value: offset, to: startOfWeek) else {
                return 0
            }
            
            let completedOnDay = habits.filter { habit in
                habit.completedDates.contains { date in
                    calendar.isDate(date, inSameDayAs: day)
                }
            }.count
            
            return habits.isEmpty ? 0 : (Double(completedOnDay) / Double(habits.count)) * 100
        }
    }
    
    var highlights: [Highlight] {
        guard !habits.isEmpty else {
            return [
                Highlight(
                    icon: "plus.circle",
                    iconColor: Colors.primary,
                    title: "No Habits Yet",
                    subtitle: "Create your first habit to see insights here"
                )
            ]
        }
        
        var generatedHighlights: [Highlight] = []
        
        // Top habit
        if let topHabit = habits.max(by: { $0.completedDates.count < $1.completedDates.count }),
           topHabit.completedDates.count > 0 {
            generatedHighlights.append(
                Highlight(
                    icon: "star.fill",
                    iconColor: Colors.secondary,
                    title: "Top Habit: \(topHabit.title)",
                    subtitle: "Completed \(topHabit.completedDates.count) times"
                )
            )
        }
        
        // Best streak
        let bestStreakValue = habits.map { StreakCalculator.currentStreak(for: $0) }.max() ?? 0
        if bestStreakValue > 0 {
            generatedHighlights.append(
                Highlight(
                    icon: "flame.fill",
                    iconColor: Colors.primary,
                    title: "Best Streak",
                    subtitle: "\(bestStreakValue) days - Keep it up!"
                )
            )
        }
        
        // Total completions
        let total = habits.reduce(0) { $0 + $1.completedDates.count }
        if total > 0 {
            generatedHighlights.append(
                Highlight(
                    icon: "checkmark.circle.fill",
                    iconColor: Colors.success,
                    title: "Total Completions",
                    subtitle: "You've completed \(total) habits total"
                )
            )
        }
        
        if generatedHighlights.isEmpty {
            generatedHighlights.append(
                Highlight(
                    icon: "plus.circle",
                    iconColor: Colors.primary,
                    title: "Start Building Habits",
                    subtitle: "Add your first habit to see insights"
                )
            )
        }
        
        return generatedHighlights
    }
    
    func fetchHabits(context: ModelContext) {
        let descriptor = FetchDescriptor<Habit>(
            sortBy: [SortDescriptor(\.createdAt)]
        )
        
        do {
            habits = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch habits: \(error)")
            habits = []
        }
    }
}
