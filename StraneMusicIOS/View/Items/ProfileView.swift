//
//  ProfileView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image("Profile")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 40, maxHeight: 48)
            .clipShape(Circle())
    }
}

#Preview {
    ProfileView()
}
