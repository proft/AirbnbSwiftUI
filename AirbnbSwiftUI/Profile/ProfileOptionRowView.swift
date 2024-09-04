//
//  ProfileOptionRowView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 21.08.2024.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let image: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}
