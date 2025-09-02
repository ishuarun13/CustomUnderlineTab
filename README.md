
# CustomUnderlineTab

## Installation

To install this Package, import 'CustomUnderlineTab'

<ins>https://github.com/ishuarun13/CustomUnderlineTab.git</ins>

## Usage Example Screenshot
<img width="1206" height="2622" alt="Customtabbar- Bottomline" src="https://github.com/user-attachments/assets/1d4fde68-43d3-49ca-a31f-b195f0ea3611" />



''' SwiftUI
struct CustomUnderlineTab: View {
    @State private var selectedTab = 0

    let tabs = [
        TabItem(name: "Home", icon: "house.fill"),
        TabItem(name: "Profile", icon: "person.circle.fill"),
        TabItem(name: "Settings", icon: "gearshape.fill")
    ]

    var body: some View {
        VStack {
            Spacer()

            Text("Selected Tab: \(tabs[selectedTab].name)")
                .font(.title)
                .padding()

            Spacer()

            CurvedCustomTabBar(
                selectedIndex: $selectedTab,
                tabs: tabs,
                shape: .circle,
                style: TabBarStyle(
                    iconSize: 22,
                    selectedTextColor: .orange,
                    unselectedTextColor: .gray,
                    selectedIconColor: .orange,
                    unselectedIconColor: .gray,
                    font: .footnote,
                    animation: .easeInOut(duration: 0.3),
                    shapeColor: .gray.opacity(0.5),
                    selectedShapeColor: .orange,
                    unselectedShapeColor: .gray,
                    underlineColor: .orange,
                    enableLiquidEffect: true
                ),
                lookstyle: .bottom
            ) { index in
                selectedTab = index
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


## Customization

* TabBarStyle lets you control:
  -- iconSize

-- selectedTextColor / unselectedTextColor

-- selectedIconColor / unselectedIconColor

-- font

-- animation

-- shapeColor / selectedShapeColor / unselectedShapeColor

-- underlineColor

-- enableLiquidEffect

-- Supported shapes:

-- circle

-- underline



## ✨ Features
- ✅ iOS 15+ support  
- ✅ Customizable shapes (circle, underline, etc.)  
- ✅ Icon + text styling  
- ✅ Smooth animations with `withAnimation`  
- ✅ Works with `@State` bindings  



