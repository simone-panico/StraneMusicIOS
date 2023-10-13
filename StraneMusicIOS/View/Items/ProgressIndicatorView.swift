//
//  ProgressView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 12.10.2023.
//

import SwiftUI

struct ProgressIndicatorView: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
     
            let progress = configuration.fractionCompleted ?? 0.0
     
            GeometryReader { geometry in
     
                VStack(alignment: .leading) {
     
                    configuration.label
     
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color(uiColor: .systemGray5))
                        .frame(width: geometry.size.width)
                        .overlay(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(.white)
                                .frame(width: geometry.size.width * progress)
                                .overlay {
                                    if let currentValueLabel = configuration.currentValueLabel {
     
                                        currentValueLabel
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                }
                        }
     
                }
     
            }
        }
}

