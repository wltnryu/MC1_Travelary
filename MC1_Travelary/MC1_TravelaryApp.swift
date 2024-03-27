//
//  MC1_TravelaryApp.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

@main
struct MC1_TravelaryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TripModel())
        }
    }
}
