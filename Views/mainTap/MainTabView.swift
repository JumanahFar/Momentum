//
//  MainTabView.swift
//  Momentum
//
//  Created by Jumana on 28/07/2026.
//
import SwiftUI

struct MainTabView: View {
    
    
    @State private var selectedTab: AppTab = .home
    
    var body: some View {

        NavigationStack {

            Group {

                switch selectedTab {

                case .home:
                    HomeView()

                case .statistics:
                    StatisticsView()

                case .settings:
                    SettingsView()

                }

            }
            .safeAreaInset(edge: .bottom) {

                BottomNavigation(selectedTab: $selectedTab)

            }

        }

    }
}
#Preview {
    MainTabView()
}

