//
//  ListingDetailView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 12.08.2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ? .la : .miami,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageView(images: listing.images)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.leading, 32)
                        .padding(.top, 48)
                }
            }
                
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 12) {
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            hostView
            
            Divider()
            
            featuresView
            
            Divider()
            
            bedroomsView
            
            Divider()
            
            amenitiesView
            
            Divider()
            
            mapView
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            bottomView
        }
    }
    
    var featuresView: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(listing.features) { feature in
                HStack(spacing: 12) {
                    Image(systemName: feature.imageName)
                    VStack(alignment: .leading) {
                        Text(feature.title)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text(feature.subtitle)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    var hostView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                
                HStack(spacing: 2) {
                    Text("\(listing.numberOfGuests) guests - ")
                    Text("\(listing.numberOfBedrooms) bedrooms - ")
                    Text("\(listing.numberOfBeds) beds - ")
                    Text("\(listing.numberOfBathrooms) baths")
                }
                .font(.caption)
            }
            .frame(width: 300, alignment: .leading)
            
            Spacer()
            
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
        }
        .padding()
    }
    
    var bedroomsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll sleep")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1...listing.numberOfBedrooms, id: \.self) { bedroom in
                        VStack {
                            Image(systemName: "bed.double")
                            Text("Bedroom \(bedroom)")
                        }
                        .frame(width: 132, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .padding()
    }
    
    var amenitiesView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What this place offers")
                .font(.headline)
            ForEach(listing.amenities) { offer in
                HStack(spacing: 8) {
                    Image(systemName: offer.imageName)
                        .frame(width: 32)
                    
                    Text(offer.title)
                        .font(.footnote)
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    var mapView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll be")
                .font(.headline)
            
            Map(position: $cameraPosition)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
    
    var bottomView: some View {
        VStack {
            Divider()
                .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("$\(listing.pricePerNight)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("Total before taxes")
                        .font(.footnote)
                    
                    Text("Oct 15 - 20")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Reserve")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.horizontal, 32)
        }
        .background(.white)
    }
}
