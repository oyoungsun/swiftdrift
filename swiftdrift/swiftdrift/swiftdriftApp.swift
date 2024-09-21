//
//  swiftdriftApp.swift
//  swiftdrift
//
//  Created by 김은정 on 9/16/24.
//

import SwiftUI
import SwiftData

@main
struct swiftdriftApp: App {
    
    let modelContainer: ModelContainer

    init() {
            do {
                modelContainer = try ModelContainer(for: Mission.self)
            } catch {
                fatalError("Could not initialize ModelContainer")
            }
        print(URL.applicationSupportDirectory.path(percentEncoded: false ))

        }
    
    var body: some Scene {

        
        WindowGroup {
                ContentView()
        }
        .modelContainer(for: [Mission.self])
    }
    



}
