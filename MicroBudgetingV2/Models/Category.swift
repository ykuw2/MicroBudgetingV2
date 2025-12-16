//
//  Category.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/10/25.
//

import Foundation
import SwiftUI

struct BudgetDay: Identifiable, Codable {
    let id: UUID
    let date: Date
    let category: BudgetCategory
}

enum BudgetCategory: String, Codable, CaseIterable {
    case low = "Low" // Green
    case medium = "Medium" // Yellow
    case high = "High" // Red
    
    var color: Color {
        switch self {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
}
