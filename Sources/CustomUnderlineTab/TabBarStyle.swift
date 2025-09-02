//
//  TabBarStyle.swift
//  CustomTabbar_Shape
//
//  Created by Mac on 02/09/25.
//

import SwiftUI


// MARK: - Tab Bar Style
public struct TabBarStyle {
    public var iconSize: CGFloat
    public var selectedTextColor: Color
    public var unselectedTextColor: Color
    public var selectedIconColor: Color
    public var unselectedIconColor: Color
    public var font: Font?
    public var animation: Animation
    public var shapeColor: Color
    public var selectedShapeColor: Color
    public var unselectedShapeColor: Color
    public var underlineColor: Color
    public var enableLiquidEffect: Bool

    public init(
        iconSize: CGFloat = 20,
        selectedTextColor: Color = .blue,
        unselectedTextColor: Color = .gray,
        selectedIconColor: Color = .blue,
        unselectedIconColor: Color = .gray,
        font: Font? = .caption,
        animation: Animation = .spring(),
        shapeColor: Color = .gray,
        selectedShapeColor: Color = .blue,
        unselectedShapeColor: Color = .clear,
        underlineColor: Color = .blue,
        enableLiquidEffect: Bool = false
    ) {
        self.iconSize = iconSize
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
        self.selectedIconColor = selectedIconColor
        self.unselectedIconColor = unselectedIconColor
        self.font = font
        self.animation = animation
        self.shapeColor = shapeColor
        self.selectedShapeColor = selectedShapeColor
        self.unselectedShapeColor = unselectedShapeColor
        self.underlineColor = underlineColor
        self.enableLiquidEffect = enableLiquidEffect
    }
}
