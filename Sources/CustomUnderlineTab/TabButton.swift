//
//  TabBarModel.swift
//  CustomTabbar_Shape
//
//  Created by Mac on 28/08/25.
//

import SwiftUI




import SwiftUI

struct TabButton: View {
    let tab: TabItem
    let isSelected: Bool
    let shape: TabShape
    let style: TabBarStyle
    let lookstyle: CustomTabBarStyle
    let trigger: Int

    var body: some View {
        VStack(spacing: 6) {
            switch lookstyle {
            case .top:
                underlineView
                iconWithShape
                textLabel
            case .bottom:
                iconWithShape
                textLabel
                underlineView
            case .iconOnly:
                iconWithShape
                underlineView
            case .sliding:
                iconWithShape
                textLabel
            }
        }
        .accessibilityLabel(tab.name)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }

    private var iconWithShape: some View {
        ZStack {
            shapeView()
                .stroke(isSelected ? style.selectedShapeColor : style.unselectedShapeColor, lineWidth: 2)
                .frame(width: shapeSize().width, height: shapeSize().height)

            RotatingIcon(systemName: tab.icon, isSelected: isSelected, style: style, trigger: trigger)
                .id(trigger)
                .frame(width: style.iconSize, height: style.iconSize)
                .foregroundColor(isSelected ? style.selectedIconColor : style.unselectedIconColor)
        }
    }

    private var textLabel: some View {
        Text(tab.name)
            .font(style.font ?? .caption)
            .foregroundColor(isSelected ? style.selectedTextColor : style.unselectedTextColor)
            .if(style.enableLiquidEffect) { view in
                view.liquidGlass(colors: [.teal, .cyan, .purple, .pink, .blue])
            }
    }

    private var underlineView: some View {
        Rectangle()
            .fill(isSelected ? style.underlineColor : .clear)
            .frame(height: 2)
            .frame(width: 40)
            .padding(.horizontal, 4)
    }

    private func shapeView() -> AnyShape {
        switch shape {
        case .rectangle: return AnyShape(RoundedRectangle(cornerRadius: 8))
        case .circle:    return AnyShape(Circle())
        case .square:    return AnyShape(Rectangle())
        case .oval:      return AnyShape(Ellipse())
        }
    }

    private func shapeSize() -> CGSize {
        switch shape {
        case .rectangle: return CGSize(width: style.iconSize * 1.8, height: style.iconSize * 1.2)
        case .circle:    return CGSize(width: style.iconSize * 1.5, height: style.iconSize * 1.5)
        case .square:    return CGSize(width: style.iconSize * 1.4, height: style.iconSize * 1.4)
        case .oval:      return CGSize(width: style.iconSize * 1.6, height: style.iconSize * 1.2)
        }
    }
}
