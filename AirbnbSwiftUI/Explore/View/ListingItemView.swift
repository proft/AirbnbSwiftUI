//
//  ListingItemView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 09.08.2024.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            ListingImageView(images: listing.images)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    Text("**$\(listing.pricePerNight)** night")
                }
                .foregroundStyle(.black)
                
                Spacer()
                
                HStack(spacing: 12) {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}
