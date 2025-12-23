//
//  MicroBudgetingV2App.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/7/25.
//

import SwiftUI
import SwiftData

@main
struct MicroBudgetingV2App: App {
    @AppStorage("reminderHour") private var reminderHour: Int = 9
    @AppStorage("reminderPM") private var reminderPM: Bool = true
    
    init() {
        NotificationManager.requestNotification()
        NotificationManager.scheduledReminder(hour: reminderHour, isPM: reminderPM)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
