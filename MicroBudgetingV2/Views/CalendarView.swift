//
//  CalendarView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/15/25.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentMonth = Date()
    
    let data: [Date : BudgetCategory]     // From SpendingData.allEntries()

    private let calendar = Calendar.current
    private let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "d" // Just the day number
        return f
    }()
    
    var body: some View {
        let month = currentMonth

        let days = calendar.range(of: .day, in: .month, for: month)!
        
        let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: month))! // Finds first day
        let startWeekday = calendar.component(.weekday, from: firstDay) - 1 // Calculating the number of empty boxes needed
        
        VStack(spacing: 8) {
            Text(month.formatted(.dateTime.month().year()))
                .font(.headline)
            
            // Weekday labels
            HStack {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day).frame(maxWidth: .infinity)
                }
            }

            // Calendar grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 6) {

                // Empty boxes before the first day
                ForEach(0..<startWeekday, id: \.self) { _ in
                    Rectangle().opacity(0)
                }

                // Days
                ForEach(days, id: \.self) { day in
                    if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDay) {
                        let category = data[date]
                        
                        Text(formatter.string(from: date))
                            .frame(maxWidth: .infinity, minHeight: 32)
                            .padding(4)
                            .background(
                                Circle()
                                    .fill(category?.color ?? Color.gray.opacity(0.2))
                            )
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    let data: [Date: BudgetCategory] = [
        // Jan 1-5
        DateComponents(calendar: .current, year: 2026, month: 1, day: 1).date!: .medium,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 2).date!: .low,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 3).date!: .low,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 4).date!: .high,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 5).date!: .medium,

        // Jan 6–10
        DateComponents(calendar: .current, year: 2026, month: 1, day: 6).date!: .low,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 7).date!: .medium,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 8).date!: .low,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!: .high,
        DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!: .low
        ]
    
    CalendarView(data: data)
}
