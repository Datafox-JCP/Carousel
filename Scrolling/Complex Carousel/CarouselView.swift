//
//  CarouselView.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct CarouselView: View {
    
    // MARK: Properties
    @State private var snappedItem = 0.0
    @State private var draggingItem = 1.0
    @State private var activeIndex = 0
    
    var views: [CarouselChild] = placeholderCarouselChild
    var xDistance = 150
    
    
    // MARK: View
    var body: some View {
        ZStack {
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                    .opacity(1.0  - (1.0 - abs(distance(view.id)) * 0.3))
                    .offset(x: getOffset(view.id), y: 0)
                    .zIndex(1.0 - abs(distance(view.id)) * 0.1)
            } // Loop
        } // ZStack
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
                        snappedItem = draggingItem
                        self.activeIndex = views.count + Int(draggingItem)
                        
                        if self.activeIndex > views.count || Int(draggingItem) >= 0 {
                            self.activeIndex = Int(draggingItem)
                        }
                    }
                }
        )
    }
    
    // MARK: - Functions
    private func distance(_ item: Int) -> Double {
        (draggingItem - Double(item).remainder(dividingBy: Double(views.count)))
    }
    
    private func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(item)
        
        return sin(angle) * Double(xDistance)
    }
}

// MARK: Preview
#Preview {
    CarouselView()
}

// MARK: - Placeholder
var placeholderCarouselChild: [CarouselChild] = [
    
    CarouselChild(id: 1, content: {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.red)
            Text("1")
                .padding()
        }
        .frame(width: 200, height: 400)
    }),
    
    CarouselChild(id: 2, content: {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.red)
            Text("2")
                .padding()
        }
        .frame(width: 200, height: 400)
    }),
    
    CarouselChild(id: 3, content: {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.red)
            Text("3")
                .padding()
        }
        .frame(width: 200, height: 400)
    })
    
]
