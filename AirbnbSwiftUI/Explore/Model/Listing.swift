//
//  Listing.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 23.08.2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let ownerId: String
    let ownerName: String
    let ownerImage: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var images: [String]
    let address: String
    let city: String
    let state: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn, superHost
    
    var id: Int { self.rawValue }
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn: return "Check yourself in with the keypad."
        case .superHost: return "Superhosts are experienced, highly rated hosts who are commited to providing greate stars for guests."
        }
    }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool, kitchen, wifi, laundry, tv, alarmSystem, office, balcony
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment, house, townHouse, villa
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}

extension Listing {
    static let listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            title: "Miami Villa",
            ownerId: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImage: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            images: ["apartment1", "apartment2", "apartment3", "apartment4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa),
        
            .init(
                id: NSUUID().uuidString,
                title: "Miami Beach House",
                ownerId: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImage: "male-profile-photo", numberOfBedrooms: 4,
                numberOfBathrooms: 3,
                numberOfGuests: 4,
                numberOfBeds: 4,
                pricePerNight: 567,
                latitude: 25.7706,
                longitude: -80.1340,
                images: ["apartment2", "apartment1", "apartment3", "apartment4"],
                address: "124 Main St",
                city: "Miami",
                state: "Florida",
                rating: 4.86,
                features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .alarmSystem, .tv, .kitchen, .office],
                type: .house),
        
            .init(
                id: NSUUID().uuidString,
                title: "Beatiful Miami apartment in downtown Brickell",
                ownerId: NSUUID().uuidString,
                ownerName: "Steve Johnson",
                ownerImage: "male-profile-photo",
                numberOfBedrooms: 4,
                numberOfBathrooms: 3,
                numberOfGuests: 4,
                numberOfBeds: 4,
                pricePerNight: 763,
                latitude: 25.7650,
                longitude: -80.1936,
                images: ["apartment3", "apartment2", "apartment1", "apartment4"],
                address: "124 Main St",
                city: "Miami",
                state: "Florida",
                rating: 4.32,
                features: [.selfCheckIn, .superHost], amenities: [.wifi, .alarmSystem, .balcony],
                type: .apartment),
        
            .init(
                id: NSUUID().uuidString,
                title: "Beatiful Los Angeles home in Malibu",
                ownerId: NSUUID().uuidString,
                ownerName: "Harry Styles",
                ownerImage: "male-profile-photo",
                numberOfBedrooms: 4,
                numberOfBathrooms: 3,
                numberOfGuests: 4,
                numberOfBeds: 4,
                pricePerNight: 763,
                latitude: 34.2,
                longitude: -118.0426,
                images: ["apartment4", "apartment2", "apartment3", "apartment1"],
                address: "124 Main St",
                city: "Los Angeles",
                state: "California",
                rating: 4.97, features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .alarmSystem, .pool],
                type: .apartment),
        
            .init(
                id: NSUUID().uuidString,
                title: "Beatiful Los Angeles home in the Hollywood Hills",
                ownerId: NSUUID().uuidString,
                ownerName: "Timothy Chalamet",
                ownerImage: "male-profile-photo",
                numberOfBedrooms: 4,
                numberOfBathrooms: 3,
                numberOfGuests: 4,
                numberOfBeds: 4,
                pricePerNight: 763,
                latitude: 34.1,
                longitude: -118.1426,
                images: ["apartment1", "apartment2", "apartment3", "apartment4"],
                address: "124 Main St",
                city: "Los Angeles",
                state: "California",
                rating: 4.86,
                features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .alarmSystem, .balcony],
                type: .apartment)
    ]
}
