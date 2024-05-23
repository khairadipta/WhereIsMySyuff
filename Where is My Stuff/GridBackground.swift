//
//  GridBackground.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 22/05/24.
//

import SwiftUI

struct GridBackground: View {
    var body: some View {
        // Implement your grid dots pattern here
        // You can use shapes like Circle or small Rectangles to create the dots
        // Example:
        Color.wmsWhite
            .overlay(
                VStack(spacing: 40) {
                    ForEach(0..<20) { _ in
                        HStack(spacing: 40) {
                            ForEach(0..<28) { _ in
                                Circle()
                                    .fill(Color.wmsDarkBrown)
                                    .frame(width: 3, height: 3)
                            }
                        }
                    }
                }
            )
    }
}
#Preview {
    GridBackground()
}
