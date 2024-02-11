//
//  CarouselSecondSampleView.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct CarouselSecondSampleView: View {
    /// Array con las imágenes
    private let images = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                    ForEach(images, id: \.self) { item in
                        GeometryReader { geo in
                            Image(item)
                                .resizable()
                                .scaledToFill()
                                .offset(x: calculateOffset(scrollOffset: geo.frame(in: .global).minX))
                                .frame(width: 300, height: 500)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .scrollTransition(axis: .horizontal) { image, phase in
                                    image.scaleEffect(phase.isIdentity ? 1 : 0.4)
                                } // transition
                        } // Georeader
                    } // Loop
                .frame(width: 300, height: 500)
            } // HStack
            .scrollTargetLayout()
        } // Scroll
        .contentMargins(20)
        .scrollTargetBehavior(.viewAligned)
    }
    
    // MARK: - Functions
    private func calculateOffset(scrollOffset: CGFloat) -> CGFloat {
        let adjustedOffset = scrollOffset / 5
        return adjustedOffset
    }
}

#Preview {
    CarouselSecondSampleView()
}
