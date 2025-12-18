//
//  NotificationManager.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/18/25.
//

import UserNotifications

class NotificationManager {
    static func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error = error {
                print("Notification authorization error: \(error)")
            } else {
                print("Notification authorization success: \(success)")
            }
        }
    }
    
    static func shceduledReminder(hour: Int, isPM: Bool) {
        // The content of the reminder notification
        let content = UNMutableNotificationContent()
        content.title = "Spending Reminder"
        content.body = "Make sure to track your spending today!"
        content.sound = .default
        
        // The hours
        var notificationHour = hour % 12
        if isPM {
            notificationHour += 12
        }
        
        // Create trigger
        var dateComponents = DateComponents()
        dateComponents.hour = notificationHour
        dateComponents.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Request
        let request = UNNotificationRequest(identifier: "spendingReminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            } else {
                print("Succeeded to schedule notification at \(hour)\(isPM ? "PM":"AM")")
            }
        }
    }
}

