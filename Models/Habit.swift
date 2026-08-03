//
//  Habit.swift
//  Momentum
//
//  Created by Jumana on 26/07/2026.
//
import Foundation
import SwiftData

@Model
final class Habit {

    
    @Attribute(.unique)
        var id: UUID
    
    var title: String

    var habitDescription: String

    var category: String

    var frequency: String

    var reminderTime: Date?

    var createdAt: Date

    var completedDates: [Date]

    init(
        title: String,
        habitDescription: String,
        category: String,
        frequency: String,
        reminderTime: Date? = nil
    ) {
        
        self.id = UUID()

        self.title = title
        self.habitDescription = habitDescription
        self.category = category
        self.frequency = frequency
        self.reminderTime = reminderTime

        self.createdAt = Date()

        self.completedDates = []

    }

}
