////
////  ContentView.swift
////  Where is My Stuff
////
////  Created by Khai Dipta on 21/05/24.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject var beaconManager = BeaconManager()
//    @State private var circleColor: Color = .white
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(circleColor)
//                .frame(width: 200, height: 200) // Adjust size as needed
//            Text("Hello, World!")
//                .padding()
//        }
//        .onReceive(beaconManager.$proximity) { proximity in
//            switch proximity {
//            case .immediate:
//                circleColor = .green
//            case .near:
//                circleColor = .yellow
//            case .far:
//                circleColor = .red
//            case .unknown:
//                circleColor = .gray
//            @unknown default:
//                circleColor = .blue // Handle any future unknown cases
//            }
//        }
//        
//        // Pass beacon proximity state to GameView
//        GameView(beaconProximity: $beaconManager.proximity)
//    }
//}
//
//
//
