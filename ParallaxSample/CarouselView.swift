//
//  CarouselView.swift
//  ParallaxSample
//
//  Created by Juanjo Corbalan on 13/5/24.
//

import SwiftUI

struct CarouselView: View {

    private struct Settings {
        static let height: CGFloat = 480.0
        static let imagePadding: CGFloat = 32.0
        static let radius: CGFloat = 16.0
        static let spacing: CGFloat = 2.0
        static let titlePadding: CGFloat = 30.0
    }

    var body: some View {
        GeometryReader(content: { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: Settings.spacing) {
                    ForEach(places) { place in
                        GeometryReader(content: { itemProxy in
                            ZStack {
                                Image(place.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .offset(x: -(itemProxy.frame(in: .scrollView).minX - Settings.imagePadding))
                                    .frame(minWidth: proxy.size.width)
                                    .frame(width: itemProxy.size.width, height: itemProxy.size.height)
                                VStack {
                                    Spacer()
                                    Text(place.title)
                                        .font(.largeTitle.bold())
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(Settings.titlePadding)
                            }
                            .clipShape(.rect(cornerRadius: Settings.radius))
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 4, y: 4)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view.scaleEffect(phase.isIdentity ? 1 : 0.9)
                            }
                        })
                        .frame(width: proxy.size.width - Settings.imagePadding * 2, height: proxy.size.height - 8)
                    }
                }
                .scrollTargetLayout()
                .padding(.horizontal, Settings.imagePadding)
                .frame(height: proxy.size.height, alignment: .top)
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        })
        .frame(height: Settings.height)
    }
}

#Preview {
    CarouselView()
}
