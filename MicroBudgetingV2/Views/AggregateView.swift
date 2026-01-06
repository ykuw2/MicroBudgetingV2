//
//  AggregateView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/23/25.
//

import SwiftUI
import Charts

struct PieChartView: View {
    var slices: [(category: BudgetCategory, amount: Double)]

    var body: some View {
        if slices.isEmpty {
            Text("No data yet")
                .foregroundStyle(.secondary)
        } else {
            Chart(slices, id: \.category) { item in
                SectorMark(
                    angle: .value("Days", item.amount),
                )
                .foregroundStyle(item.category.color)
            }
            .frame(height: 220)
        }
    }
}

struct AggregateView: View {
    let data: [Date : BudgetCategory]

    var categoryCounts: [BudgetCategory: Int] {
        var counts: [BudgetCategory: Int] = [:]
        for (_, category) in data {
            counts[category, default: 0] += 1
        }
        return counts
    }

    var pieSlices: [(category: BudgetCategory, amount: Double)] {
        BudgetCategory.allCases
            .map { ($0, Double(categoryCounts[$0, default: 0])) }
            .filter { $0.1 > 0 }
            .map { (category: $0.0, amount: $0.1) }
    }

    var body: some View {
        if data.isEmpty {
            Text("The Spending Overview will be shown here!")
                .bold()
        } else {
            VStack(spacing: 16) {
                Text("Spending Overview of this Month:")
                    .bold()

                PieChartView(slices: pieSlices)

                ForEach(BudgetCategory.allCases, id: \.self) { category in
                    Text("\(category.rawValue): \(categoryCounts[category] ?? 0)")
                }
            }
        }
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
    
    AggregateView(data: data)
}
