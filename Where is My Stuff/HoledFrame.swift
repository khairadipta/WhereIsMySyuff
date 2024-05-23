//
//  HoledFrame.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 22/05/24.
//

import SwiftUI

struct HoledFrame: View {
    var body: some View {
        ZStack {
            GridBackground()
            Rectangle()
                .fill(Color.black.opacity(1))
                .frame(width: 500, height: 500) // Adjust the frame size as per your requirements
//                .cornerRadius(/*@START_MENU_TOKEN@*/18.0/*@END_MENU_TOKEN@*/)
                .mask(HoleShape())
                .border(/*@START_MENU_TOKEN@*/Color("WMS_DarkBrown")/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/8/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/18.0/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.wmsBlueDark, radius: 0, x: 10, y: 10)
        }
    }
}


struct HoleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path(rect)
        let holeRect = CGRect(x: rect.midX - 50, y: rect.midY - 50, width: 100, height: 100) // Adjust the hole position and size as per your requirements
        path.addRect(holeRect)
        return path
    }
}


#Preview {
    HoledFrame()
}
