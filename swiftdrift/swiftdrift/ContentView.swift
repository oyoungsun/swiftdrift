//
//  ContentView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var issheet = false
    var body: some View {
            TabView {
                HobanView()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                        
                    }
                
                MissonView()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Second")
                    }
                
                Text("The Last Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
                    .badge(10)
            }
            .sheet(isPresented: $issheet, content: {
                Text("hello")
                
                
            })
            .padding()
        }
}

#Preview {
    NavigationStack{
        ContentView()
    }
}
