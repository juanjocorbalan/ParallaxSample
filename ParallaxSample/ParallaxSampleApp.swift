//
//  ParallaxSampleApp.swift
//  ParallaxSample
//
//  Created by Juanjo Corbalan on 13/5/24.
//

import SwiftUI

@main
struct ParallaxSampleApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                VStack {
                    CarouselView()
                        .frame(height: proxy.size.height / 2.0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
