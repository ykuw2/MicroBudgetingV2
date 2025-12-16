//
//  SpendingData.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/11/25.
//

import Combine
import SwiftUI

class SpendingData: ObservableObject { // Remember again that when data changes need to use Observable Object
    @AppStorage("spendingData") private var spendingData: Data = Data()
    
    private var formatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        return f
    }
    
    private var todayKey: String {
        formatter.string(from: Date())
    }
    
    // Load dictionary for all of the days
    private func load() -> [String : String] {
        guard let dict = try? JSONDecoder().decode([String: String].self, from: spendingData) else { // Data saved as JSON
            return [:]
        }
        return dict
    }
    
    // Save dictionary
    private func save(_ dict: [String : String]) {
        spendingData = (try? JSONEncoder().encode(dict)) ?? Data()
        objectWillChange.send() // Triggers Change
    }

    func saveToday(_ category: BudgetCategory) {
        var dict = load()
        dict[todayKey] = category.rawValue
        save(dict)
    }
    
    func getToday() -> BudgetCategory? {
        let dict = load()
        guard let raw = dict[todayKey] else { return nil }
        return BudgetCategory(rawValue: raw)
    }
    
    // Gets all the entries
    func allEntries() -> [Date : BudgetCategory] {
            let dict = load()
            var result: [Date : BudgetCategory] = [:]
            
            for (key, rawValue) in dict {
                if let date = formatter.date(from: key),
                   let category = BudgetCategory(rawValue: rawValue) {
                    result[date] = category
                }
            }
            return result
        }
}
