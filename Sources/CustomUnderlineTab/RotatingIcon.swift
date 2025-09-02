//
//  Untitled.swift
//  CustomTabbar_Shape
//
//  Created by Mac on 01/09/25.
//
import SwiftUI

public struct RotatingIcon: View {
    let systemName: String
    let isSelected: Bool
    let style: TabBarStyle
    let trigger: Int   // external trigger
    
    @State private var rotation: Double = 0
    
    public var body: some View {
        if #available(iOS 15.0, *) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: style.iconSize, height: style.iconSize)
                .foregroundColor(isSelected ? style.selectedTextColor : style.unselectedIconColor)
                .rotationEffect(.degrees(rotation))
                .onChangeWithOld(of: trigger) { newValue, oldValue in
                    if isSelected {
                        spinOnce()
                    } else {
                        rotation = 0
                    }
                }

        } else {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: style.iconSize, height: style.iconSize)
                .foregroundColor(isSelected ? style.selectedTextColor : style.unselectedIconColor)
                .rotationEffect(.degrees(rotation))
                .onChange(of: trigger) { _ in
                    if isSelected {
                        spinOnce()
                    } else {
                        rotation = 0
                    }
                }
        }

            
    }
    
    private func spinOnce() {
        rotation = 0
        withAnimation(.easeInOut(duration: 0.6)) {
            rotation = 360
        }
    }
}

extension View {
    func onChangeWithOld<Value: Equatable>(
        of value: Value,
        perform action: @escaping (_ newValue: Value, _ oldValue: Value) -> Void
    ) -> some View {
        self.modifier(OnChangeWithOldModifier(value: value, action: action))
    }
}

private struct OnChangeWithOldModifier<Value: Equatable>: ViewModifier {
    let value: Value
    let action: (Value, Value) -> Void
    
    @State private var oldValue: Value
    
    init(value: Value, action: @escaping (Value, Value) -> Void) {
        self.value = value
        self.action = action
        _oldValue = State(initialValue: value)
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: value) { newValue in
                let previous = oldValue
                oldValue = newValue
                action(newValue, previous)
            }
    }
}
