//
//  AggregateView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/23/25.
//

import SwiftUI

struct AggregateView: View {
    
    let data: [Date : BudgetCategory]
    
    var categoryCounts: [BudgetCategory: Int] {
        var counts: [BudgetCategory: Int] = [:]
        for (_, category) in data {
            counts[category, default: 0] += 1
        }
        return counts
    }
    
    var body: some View {
        if data.isEmpty {
            Text("The Spending Overview will be shown here!")
                .bold()
        } else {
            Text("Spending Overview of this Month:")
                .bold()
            
            ForEach(BudgetCategory.allCases, id: \.self) { category in
                Text("\(category.rawValue): \(categoryCounts[category] ?? 0)")
            }
        }
    }
}


#Preview {
    let data : [Date : BudgetCategory] = [:] // Dummy data
    AggregateView(data: data)
}
