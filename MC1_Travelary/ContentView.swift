//
//  ContentView.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/22/24.
//

import SwiftUI

struct ContentView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        NavigationView {
            TabView {
                TripView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("나의 여행")
                    }
                
                FriendView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("친구 목록")
                    }
                
                SettingView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("더보기")
                    }
            }
            .accentColor(Color(red: 101/255, green: 117/255, blue: 255/255))
        }
    }
}

#Preview {
    ContentView()
}
