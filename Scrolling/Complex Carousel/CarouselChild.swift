//
//  CarouselChild.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import SwiftUI

struct CarouselChild: View, Identifiable {
    var id: Int
    @ViewBuilder var content: any View
    
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}
