//
//  TimeView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/9/25.
//

import SwiftUI

struct TimeView: View {
    @AppStorage("reminderHour") private var reminderHour: Int = 9
    @AppStorage("reminderPM") private var reminderPM: Bool = true
    @AppStorage("showMainView") private var showMainView: Bool = false
    @AppStorage("showTimeView") private var showTimeView: Bool = false
    
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        VStack {
            Text("When should I notify to you log your spending?")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .padding()
            
            HStack{
                Picker("", selection: $reminderHour) {
                    ForEach(1...12, id: \.self) { hour in
                            Text("\(hour)")
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60)
                .clipped()
                
                Picker("", selection: $reminderPM) {
                    Text("AM")
                        .foregroundColor(.white)
                        .bold()
                        .tag(false)

                    Text("PM")
                        .foregroundColor(.white)
                        .bold()
                        .tag(true)
                }
                .pickerStyle(.wheel)
                .frame(width: 60)
                .clipped()
            }
            .padding()
            
            Button("Go!") {
                showConfirmation = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.gray.opacity(0.7))
            .bold()
        }
        .alert("Are you sure this is the time you want the notification to be sent?", isPresented: $showConfirmation, actions: {
            Button("Go Back", role: .cancel) {}
            Button("Confirm") {
                showMainView = true
                showTimeView = false
            }
        },message: {
            Text("You won't be able to change this in the future.")
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.darkGreen)
        .foregroundColor(Color.white)
    }
}

#Preview {
    TimeView()
}
