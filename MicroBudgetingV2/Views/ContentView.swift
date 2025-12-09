//
//  ContentView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("showTimeView") private var showTimeView: Bool = false
    
    @State private var showWelcomeView: Bool = true
    
    var body: some View {
        if showWelcomeView {
            WelcomeView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeOut(duration: 0.5)) {
                            showWelcomeView = false
                        }
                    }
                }
        } else {
            if showTimeView {
                // TimeView here
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
