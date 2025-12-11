//
//  Category.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/10/25.
//

import Foundation

struct BudgetDay: Identifiable, Codable {
    let id: UUID
    let date: Date
    let category: BudgetCategory
}

enum BudgetCategory: String, Codable, CaseIterable {
    case low = "Low" // Green
    case medium = "Medium" // Yellow
    case high = "High" // Red
}
