//
//  ExploreView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 09.08.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showSearchDestinationView = false
    @StateObject var vm = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if showSearchDestinationView {
                SearchDestinationView(show: $showSearchDestinationView, vm: vm)
            } else {
                ScrollView {
                    SearchView(location: $vm.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showSearchDestinationView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(vm.listings) { item in
                            NavigationLink(value: item) {
                                ListingItemView(listing: item)
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { item in
                    ListingDetailView(listing: item)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
