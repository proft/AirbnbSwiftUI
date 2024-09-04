//
//  ProfileView.swift
//  AirbnbSwiftUI
//
//  Created by Ivan Morgun on 21.08.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to start planning your next trip")
                }
                
                Button {
                    print("Log in")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                HStack {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            
            options
        }
        .padding()
    }
    
    var options: some View {
        VStack(spacing: 24) {
            ProfileOptionRowView(image: "gear", title: "Settings")
            ProfileOptionRowView(image: "gear", title: "Accessibility")
            ProfileOptionRowView(image: "questionmark.circle", title: "Visit the help center")
        }
        .padding(.vertical)
    }
}
