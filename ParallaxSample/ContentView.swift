//
//  ContentView.swift
//  ParallaxSample
//
//  Created by Juanjo Corbalan on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Places")
                .font(.largeTitle.bold())
            GeometryReader(content: { proxy in
                let size = proxy.size
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(places) { item in
                            GeometryReader(content: { proxy in
                                let itemsSize = proxy.size
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio (contentMode: . fill)
                                    .frame(width: itemsSize.width, height: itemsSize.height)
                                    .clipShape(.rect(cornerRadius: 16))
                                    .shadow(color: .black.opacity(0.4), radius: 2, x: 4, y: 4)
                            })
                            .frame(width: size.width - 40, height: size.height - 10)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view.scaleEffect(phase.isIdentity ? 1 : 0.94)
                            }
                        }
                    }
                    .scrollTargetLayout()
                    .padding(.horizontal, 40)
                    .frame(height: size.height, alignment: .top)
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .padding(.horizontal, -20)
            })
            .frame(height: 450)
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}
