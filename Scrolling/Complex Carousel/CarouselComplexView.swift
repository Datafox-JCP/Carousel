//
//  CarouselComplexView.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct CarouselComplexView: View {
    var body: some View {
        ZStack {
            CarouselView(views: getChildViews())
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
    
    private func getChildViews() -> [CarouselChild] {
        var tempViews: [CarouselChild] = []
        
        for i in (1...3) {
            tempViews.append(CarouselChild(id: i, content: {
                ZStack {
                    Image("\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .mask {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 350, height: 500)
                        }
                }
                .frame(width: 350, height: 500)
                .shadow(radius: 10)
            }))
        }
        
        return tempViews
    }
}

#Preview {
    CarouselComplexView()
}
