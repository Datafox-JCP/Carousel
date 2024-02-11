//
//  ParallaxMainView.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct ParallaxMainView: View {
    var body: some View {
        TabView {
            ParallaxHomeView()
                .tabItem {
                    Label(
                        title: { Text("Principal") },
                        icon: { Image(systemName: "house.fill") }
                    )
                }
            
            Text("Explorar")
                .tabItem {
                    Label(
                        title: { Text("Principal") },
                        icon: { Image(systemName: "safari.fill") }
                    )
                }
            
            Text("Favoritos")
                .tabItem {
                    Label(
                        title: { Text("Favoritos") },
                        icon: { Image(systemName: "heart") }
                    )
                }
            
            Text("Perfil")
                .tabItem {
                    Label(
                        title: { Text("Favoritos") },
                        icon: { Image(systemName: "person.fill") }
                    )
                }
        }
        .tint(.purple)
    }
}

#Preview {
    ParallaxMainView()
}
