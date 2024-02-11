//
//  CarouselSampleView.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct CarouselSampleView: View {
    // MARK: Properties
    @State private var currentIndex = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    /// Array con las imágenes
    private let images = ["1", "2", "3", "4", "5"]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .frame(width: 300, height: 500)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .scaleEffect(currentIndex == index ? 1.2 : 0.0)
                            .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                    } // Loop
                } // ZStack
                // MARK: - Gesture
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 50
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(images.count - 1, currentIndex + 1)
                                }
                            }
                        })
                )
            } // VSTack
            .navigationTitle("😼 GATOS")
            // MARK: - Scroll buttons
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            withAnimation {
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } label: {
                            Image(systemName: "arrowshape.left.circle")
                                .font(.caption)
                        }
                        
                        Button {
                            withAnimation {
                                currentIndex = min(images.count - 1, currentIndex + 1)
                            }
                        } label: {
                            Image(systemName: "arrowshape.right.circle")
                                .font(.caption)
                        }
                    }
                }
            }
        } // Nav
    } // View
}

// MARK: - Preview
#Preview {
    CarouselSampleView()
}
