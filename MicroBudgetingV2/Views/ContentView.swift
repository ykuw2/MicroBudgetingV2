//
//  ContentView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("showMainView") private var showMainView: Bool = false
    @AppStorage("showTimeView") private var showTimeView: Bool = false
    
    @State private var showWelcomeView: Bool = true
    
    var body: some View {
        if showWelcomeView {
            WelcomeView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showWelcomeView = false
                    }
                }
        } else {
            if showTimeView {
                TimeView()
            } else if !showTimeView && showMainView {
                HomeView()
                
            } else {
                NameView()
            }
        }
    }
}

#Preview {
    ContentView()
        .onAppear {
            UserDefaults.standard.removeObject(forKey: "userName")
            UserDefaults.standard.removeObject(forKey: "showTimeView")
            UserDefaults.standard.removeObject(forKey: "showMainView")
        }
}
