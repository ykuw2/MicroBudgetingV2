//
//  HomeView.swift
//  MicroBudgetingV2
//
//  Created by Yuki Kuwahara on 12/8/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showSheet: Bool = false
    @ObservedObject private var storage = SpendingData()
    
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Image(systemName: "plus.circle").opacity(0)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Text("Home")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20))
                }
            }
            .padding(.horizontal, 15)
                
            Divider()
            
            Spacer()

            CalendarView(data: storage.allEntries())
            
            Spacer()
                .frame(height: 50)
            
            AggregateView(data: storage.allEntries())
            
            Spacer()
            
        }
        .sheet(isPresented: $showSheet) {
            SpendingSheetView()
                .presentationDetents([.height(350), .medium])
        }
    }
}

#Preview {
    HomeView()
}
