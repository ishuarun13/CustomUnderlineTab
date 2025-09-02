//
//  CustomTabBar.swift
//  CustomTabbar_Shape
//
//  Created by Mac on 28/08/25.
//

import SwiftUI

// MARK: - Custom Tab Bar
@available(iOS 13.0, *)
public struct CurvedCustomTabBar: View {
    @Binding private var selectedIndex: Int
    @State private var tapTrigger: Int = 0
    let tabs: [TabItem]
    let shape: TabShape
    let style: TabBarStyle
    let onTabSelected: (Int) -> Void
    let lookstyle: CustomTabBarStyle

    public init(
        selectedIndex: Binding<Int>,
        tabs: [TabItem],
        shape: TabShape,
        style: TabBarStyle,
        lookstyle: CustomTabBarStyle,
        onTabSelected: @escaping (Int) -> Void
    ) {
        self._selectedIndex = selectedIndex
        self.tabs = tabs
        self.shape = shape
        self.style = style
        self.onTabSelected = onTabSelected
        self.lookstyle = lookstyle
    }

    public var body: some View {
        ZStack {
            HStack {
                ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
                    Button {
                        withAnimation(style.animation) {
                            selectedIndex = index
                            onTabSelected(index)
                            tapTrigger += 1
                        }
                    } label: {
                        TabButton(
                            tab: tab,
                            isSelected: selectedIndex == index,
                            shape: shape,
                            style: style,
                            lookstyle: lookstyle,
                            trigger: tapTrigger
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
            .padding(.bottom, safeAreaBottomPadding())
            .padding(.horizontal, 16)
        }
    }

    private func safeAreaBottomPadding() -> CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow?.safeAreaInsets.bottom }
            .first ?? 20
    }
}

struct CurvedCustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


