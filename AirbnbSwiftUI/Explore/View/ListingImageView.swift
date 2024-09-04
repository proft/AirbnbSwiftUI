//
//  ListingImageView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 12.08.2024.
//

import SwiftUI

struct ListingImageView: View {
    let images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                Image(item)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}
