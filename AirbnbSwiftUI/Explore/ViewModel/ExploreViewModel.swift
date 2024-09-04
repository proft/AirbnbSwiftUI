//
//  ExploreViewModel.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 24.08.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    
    private let service: ExploreService
    private var originalListings = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        Task { await fetch() }
    }
    
    func fetch() async {
        do {
            self.listings = try await service.fetch()
            self.originalListings = self.listings
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func updateListings() {
        let filtered = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() || $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filtered.isEmpty ? originalListings : filtered
    }
}
