//
//  PictureView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 09.10.2023.
//

import SwiftUI

struct PictureView: View {
    var body: some View {
        VStack {
            Image("test2")
                .frame(width: 120, height: 90)
            Text("JUCE WRLD")
                .font(.system(size: 12, weight: .light))
            Text("JUCE WRLD")
                .bold()
        }
        
    }
}

#Preview {
    PictureView()
}
