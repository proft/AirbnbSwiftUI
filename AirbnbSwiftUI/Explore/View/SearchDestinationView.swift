//
//  SearchDestinationView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 19.08.2024.
//

import SwiftUI

enum DestinationSearchOptions {
    case location, dates, guests
}

struct SearchDestinationView: View {
    @Binding var show: Bool
    @ObservedObject var vm: ExploreViewModel
    
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guests = 0
    
    var body: some View {
        VStack {
            topBar
            
            whereView
            
            dateView
            
            guestView
            
            Spacer()
        }
    }
    
    var topBar: some View {
        HStack {
            Button {
                withAnimation(.snappy) {
                    vm.updateListings()
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            if !vm.searchLocation.isEmpty {
                Button("Clear") {
                    vm.searchLocation = ""
                    vm.updateListings()
                }
                .foregroundStyle(.black)
                .font(.subheadline)
                .fontWeight(.semibold)
            }
        }
        .padding()
    }
    
    var guestView: some View {
        VStack(alignment: .leading) {
            if selectedOption == .guests {
                Text("Who's coming")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Stepper {
                    Text("\(guests) Adults")
                } onIncrement: {
                    guests += 1
                } onDecrement: {
                    guard guests > 0 else { return }
                    guests -= 1
                }
            } else {
                CollapsedPickerView(title: "Who", description: "Add guests")
            }
        }
        .modifier(CollapsibleDestinationViewModifier())
        .frame(height: selectedOption == .guests ? 120 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .guests }
        }
    }
    
    var dateView: some View {
        VStack(alignment: .leading) {
            if selectedOption == .dates {
                Text("When's your trip?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack {
                    DatePicker("From", selection: $startDate, displayedComponents: .date)
                    Divider()
                    DatePicker("To", selection: $endDate, displayedComponents: .date)
                }
                .foregroundStyle(.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
            } else {
                CollapsedPickerView(title: "When", description: "Add dates")
            }
        }
        .modifier(CollapsibleDestinationViewModifier())
        .frame(height: selectedOption == .dates ? 180 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .dates }
        }
    }
    
    var whereView: some View {
        VStack(alignment: .leading) {
            if selectedOption == .location {
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    Image(systemName: "magnifyigglass")
                        .imageScale(.small)
                    
                    TextField("Search destinations", text: $vm.searchLocation)
                        .font(.subheadline)
                        .onSubmit {
                            vm.updateListings()
                            show.toggle()
                        }
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color(.systemGray4))
                }
            } else {
                CollapsedPickerView(title: "Where", description: "Add destination")
            }
        }
        .modifier(CollapsibleDestinationViewModifier())
        .frame(height: selectedOption == .location ? 120 : 64)
        .onTapGesture {
            withAnimation(.snappy) { selectedOption = .location }
        }
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }

        }
    }
}
