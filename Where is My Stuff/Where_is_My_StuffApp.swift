//
//  Where_is_My_StuffApp.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 21/05/24.
//

import SwiftUI

@main
struct Where_is_My_StuffApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(beaconProximity: .constant(.unknown))
        }
    }
}
