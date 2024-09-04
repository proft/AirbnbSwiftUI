//
//  MainTabView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 23.08.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            WishlistsView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
