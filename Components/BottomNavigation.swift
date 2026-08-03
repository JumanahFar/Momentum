//
//  BottomNavigation.swift
//  Momentum
//
//  Created by Jumana on 24/07/2026.
//
import SwiftUI

struct BottomNavigation: View {

    @Binding var selectedTab: AppTab

    var body: some View {

        HStack {

            Spacer()

            navigationItem(
                title: "Home",
                icon: "house.fill",
                tab: .home
            )

            Spacer()

            navigationItem(
                title: "Statistics",
                icon: "chart.bar.fill",
                tab: .statistics
            )

            Spacer()

            navigationItem(
                title: "Settings",
                icon: "gearshape.fill",
                tab: .settings
            )

            Spacer()

        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
        .padding(.horizontal)
        
    }

    @ViewBuilder
    private func navigationItem(
        title: String,
        icon: String,
        tab: AppTab
    ) -> some View {

        Button {

            withAnimation(.easeInOut(duration: 0.2)) {
                   selectedTab = tab
               }


        } label: {

            VStack(spacing: 4) {

                Image(systemName: icon)
                    .font(
                        selectedTab == tab
                        ? .title2
                        : .title3
                    )

                Text(title)
                    .font(Fonts.caption)

            }
            .foregroundStyle(
                selectedTab == tab
                ? Colors.primary
                : Colors.textSecondary
            )

        }

    }

}

#Preview {

    @Previewable @State var selectedTab: AppTab = .home

    BottomNavigation(selectedTab: $selectedTab)
        .padding()

}
