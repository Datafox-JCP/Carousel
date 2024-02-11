//
//  ParallaxHomeView.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct ParallaxHomeView: View {
    
    // MARK: View
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 20) {
                header
                
                VStack(alignment: .leading) {
                    Text("Hola Juan Carlos")
                        .opacity(0.5)
                    
                    Text("¿Cuál te gusta más?")
                        .bold()
                        .font(.largeTitle)
                } // VStack
                
                // MARK: - Cards
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(catsList) { card in
                                GeometryReader { geometry in
                                    let cardSize = geometry.size
                                    let minX = min(geometry.frame(in: .scrollView).minX * 1.4, geometry.size.width * 1.4)
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width * 2.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay {
                                            OverlayView(card: card)
                                        }
                                        .clipShape(.rect(cornerRadius: 20))
                                        .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 10)
                                } // GeoReader
                                .frame(width: size.width - 60, height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.85)
                                }
                            } // Loop
                        } // HStack
                        .padding(20)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    } // Scroll
                    .scrollIndicators(.hidden)
                } // GeoReader
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 12)
            } // VStack
            .padding()
        } // Scroll
    }
    
    // MARK: - Header
    var header: some View {
        HStack(spacing: 16) {
            Label(
                title: { Text("Temixco, MX") },
                icon: { Image(systemName: "map") }
            )
            .opacity(0.6)
            
            Spacer()
            
            Image(.profile)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .clipShape(Circle())
        } // HStack
    }
    
    // MARK: - Overlay text
    @ViewBuilder
    func OverlayView(card: Cat) -> some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(colors: [.clear, .clear, .clear, .black.opacity(0.1), .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(card.title)
                    .font(.title)
                    .bold()
                
                Text(card.subTitle)
            } // VStack
            .foregroundStyle(.white)
            .padding()
        } // ZStack
    }
}

// MARK: - Preview
#Preview {
    ParallaxMainView()
}
