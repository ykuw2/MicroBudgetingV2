//
//  WelcomeView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/8/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("MicroBudgeting")
                .font(.title)
                .bold()
            
            
            Text("Created by: Yuki Kuwahara, 2025")
                .font(.caption)
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.darkGreen)
        .foregroundColor(Color.white)
    }
}


#Preview {
    WelcomeView()
}
