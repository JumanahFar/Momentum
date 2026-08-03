//
//  HabitViewModel.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import Foundation
import SwiftData
import Observation

@Observable
final class HabitViewModel {

    // Create

    func addHabit(
        title: String,
        description: String,
        category: String,
        frequency: String,
        reminderTime: Date?,
        context: ModelContext
    ) {

        let habit = Habit(
            title: title,
            habitDescription: description,
            category: category,
            frequency: frequency,
            reminderTime: reminderTime
        )

        context.insert(habit)
        if reminderTime != nil {
            NotificationService.shared.scheduleNotification(for: habit)
        }

    }

    // Delete

    func deleteHabit(
        _ habit: Habit,
        context: ModelContext
    ) {
        
        NotificationService.shared.removeNotification(for: habit)

        context.delete(habit)

    }
    
    // Complete

    func markHabitCompleted(_ habit: Habit) {

        let today = Calendar.current.startOfDay(for: Date())

        let alreadyCompleted = habit.completedDates.contains {
            Calendar.current.isDate($0, inSameDayAs: today)
        }

        guard !alreadyCompleted else { return }

        habit.completedDates.append(today)

    }
    
    //Update

    func updateHabit(
        _ habit: Habit,
        title: String,
        description: String,
        category: String,
        frequency: String,
        reminderTime: Date?
    ) {

        habit.title = title
        habit.habitDescription = description
        habit.category = category
        habit.frequency = frequency
        habit.reminderTime = reminderTime
        
        NotificationService.shared.removeNotification(for: habit)

        if reminderTime != nil {
            NotificationService.shared.scheduleNotification(for: habit)
        }

    }

}
