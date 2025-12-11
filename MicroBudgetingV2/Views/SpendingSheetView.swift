//
//  SpendingSheetView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/8/25.
//

import SwiftUI

struct SpendingSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selected: BudgetCategory?
    
    var body: some View {
        HStack {
            Button("Cancel") {
                dismiss()
            }
            Spacer()
            Text("Today's Spending")
                .font(.title2)
                .bold()
            Spacer()
            Button("Done") {}
        }
        .padding()
        
        Divider()
        
        VStack {
            Text("How was your spending today?")
                .bold()
            
            SpendingButton(spendingLevel: .low, selected: $selected, color: Color.green) {
                dismiss()
            }
            SpendingButton(spendingLevel: .medium, selected: $selected, color: Color.yellow) {
                dismiss()
            }
            SpendingButton(spendingLevel: .high, selected: $selected, color: Color.red) {
                dismiss()
            }
        }
        .padding()
    }
}

struct SpendingButton: View {
    let spendingLevel: BudgetCategory
    @Binding var selected: BudgetCategory? // nil at first, and binds to parent view
    let color: Color
    
    let onTap: () -> Void // Allows closure to  be called
    
    var body: some View {
        Button {
            selected = spendingLevel
            onTap()
        } label: {
            Text(spendingLevel.rawValue)
                .font(.headline) // Small text
                .foregroundColor(.white)
                .frame(maxWidth: .infinity) // Stretch width to max
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                )
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SpendingSheetView()
}
