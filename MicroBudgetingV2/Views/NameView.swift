//
//  NameView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/8/25.
//

import SwiftUI

struct NameView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("showTimeView") private var showTimeView: Bool = false
    
    @State private var tempName: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("What is your name?")
                .font(.title)
                .bold()
                .padding()
            
            TextField("Enter your name", text: $tempName)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 30)
                .padding(.bottom)
                .foregroundStyle(Color.black)
            
            Button("Continue") {
                let trimmed = tempName.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if trimmed.isEmpty {
                    showAlert = true
                } else {
                    showTimeView = true
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .bold()
        }
        .alert("Invalid Name", isPresented: $showAlert, actions: {
            Button("Ok", role: .cancel) {}
                .buttonStyle(.borderedProminent)
        },message: {
            Text("Name cannot be blank.")
        })
    }
}


#Preview {
    NameView()
}
