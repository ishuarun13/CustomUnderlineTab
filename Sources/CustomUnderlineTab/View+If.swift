//
//  View+If.swift
//  CustomTabbar_Shape
//
//  Created by Mac on 02/09/25.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition { transform(self) } else { self }
    }
}
