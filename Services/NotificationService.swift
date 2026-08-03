//
//  NotificationService.swift
//  Momentum
//
//  Created by Jumana on 20/07/2026.
//
import Foundation
import UserNotifications
import SwiftData

final class NotificationService {

    static let shared = NotificationService()

    private init() { }
    
    func requestPermission() {

        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: [.alert, .sound, .badge]
            ) { granted, error in

                if granted {
                    print("Notifications allowed")
                } else {
                    print("Notifications denied")
                }

                if let error = error {
                    print(error.localizedDescription)
                }

            }

    }
    
    func scheduleNotification(for habit: Habit) {

        guard let reminderTime = habit.reminderTime else {
            return
        }

        let content = UNMutableNotificationContent()

        content.title = habit.title

        content.body = habit.habitDescription.isEmpty
            ? "Time to work on your habit!"
            : habit.habitDescription

        content.sound = .default

        let calendar = Calendar.current

        let components = calendar.dateComponents(
            [.hour, .minute],
            from: reminderTime
        )

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: components,
            repeats: true
        )

        let request = UNNotificationRequest(
            identifier: habit.id.uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)

    }
    
    func removeNotification(for habit: Habit) {

        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(
                withIdentifiers: [
                    habit.id.uuidString
                ]
            )

    }
    

}
