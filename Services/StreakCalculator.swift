//
//  StreakCalculator.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//

import Foundation

struct StreakCalculator {

    static func currentStreak(for habit: Habit) -> Int {

        let calendar = Calendar.current

        let completedDays = habit.completedDates
            .map { calendar.startOfDay(for: $0) }
            .sorted(by: >)

        guard !completedDays.isEmpty else {
            return 0
        }

        var streak = 0
        var currentDay = calendar.startOfDay(for: Date())

        for day in completedDays {

            if calendar.isDate(day, inSameDayAs: currentDay) {

                streak += 1

                guard let previousDay = calendar.date(
                    byAdding: .day,
                    value: -1,
                    to: currentDay
                ) else { break }

                currentDay = previousDay

            } else {
                break
            }

        }

        return streak

    }

    static func bestStreak(for habit: Habit) -> Int {

        let calendar = Calendar.current

        let completedDays = habit.completedDates
            .map { calendar.startOfDay(for: $0) }
            .sorted()

        guard !completedDays.isEmpty else {
            return 0
        }

        var best = 1
        var current = 1

        for index in 1..<completedDays.count {

            let previous = completedDays[index - 1]
            let currentDay = completedDays[index]

            if let expectedDay = calendar.date(byAdding: .day, value: 1, to: previous),
               calendar.isDate(expectedDay, inSameDayAs: currentDay) {

                current += 1
                best = max(best, current)

            } else {

                current = 1

            }

        }

        return best

    }
    
    static func consistency(for habit: Habit) -> Int {

        let calendar = Calendar.current

        let startDay = calendar.startOfDay(for: habit.createdAt)
        let today = calendar.startOfDay(for: Date())

        guard let daysSinceCreated = calendar.dateComponents(
            [.day],
            from: startDay,
            to: today
        ).day else {
            return 0
        }

        let totalDays = max(daysSinceCreated + 1, 1)

        let completedDays = Set(
            habit.completedDates.map {
                calendar.startOfDay(for: $0)
            }
        ).count

        let percentage = Double(completedDays) / Double(totalDays) * 100

        return Int(percentage.rounded())

    }
    
    static func weeklyProgress(for habit: Habit) -> [Bool] {

        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        guard let startOfWeek = calendar.date(
            from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        ) else {
            return Array(repeating: false, count: 7)
        }

        return (0..<7).map { offset in

            guard let day = calendar.date(byAdding: .day, value: offset, to: startOfWeek)
            else {
                return false
            }

            return habit.completedDates.contains {
                calendar.isDate($0, inSameDayAs: day)
            }

        }

    }
    
    static func currentWeekRange() -> String {

        let calendar = Calendar.current
        let formatter = DateFormatter()

        formatter.dateFormat = "MMM d"

        let today = Date()

        guard let start = calendar.date(
            from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)
        ),
        let end = calendar.date(byAdding: .day, value: 6, to: start)
        else {
            return ""
        }

        return "\(formatter.string(from: start)) - \(formatter.string(from: end))"

    }
    
}
