//
//  ViewFinderView.swift
//  swiftdrift
//
//  Created by 김은정 on 9/20/24.
//


import SwiftUI


struct ViewfinderView: View {
    @Binding var image: Image?

    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
