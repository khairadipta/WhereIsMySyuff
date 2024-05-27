//
//  GameView.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 21/05/24.
//

import SwiftUI
import AVFoundation
import CoreLocation


struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            
    }
}

struct GameView: View {
    @StateObject var beaconManager = BeaconManager()
    @Binding var beaconProximity: CLProximity
    @State var circleColor: Color = .red
    @StateObject private var cameraController = CameraController()
    @State private var showItem: Bool = false // Added state variable to show/hide item
    @State private var showSuccessPage: Bool = false
    @State private var itemCount: Int = 0
    @State private var messageText: String = ""
    @State private var messageImage: String = "Boni_Worry"
    
    var body: some View {
        ZStack {
            // Camera View and Beacon Indicator
            GridBackground()
            // Camera view should be always on
            CameraView(cameraController: cameraController, cornerRadius: 20, borderWidth: 8, borderColor: Color.wmsDarkBrown)
                .frame(width: 850, height: 530)
                .shadow(color: Color.wmsBlueDark, radius: 0, x: 8, y: 8)
                .offset(x: 0, y:15)
                .padding()
                .onAppear {
                    //                    cameraController.session?.startRunning()
                }
            // Circle indicator
            ZStack {
                // Border
                Circle()
                    .frame(width: 35)
                    .foregroundColor(Color.wmsDarkBrown)
                    .offset(x: 0, y: 0)
                // Beacon Indicator: should change based on proximity
                Circle()
                    .fill(circleColor)
                    .frame(width: 25)
                //                .foregroundColor(circleColor(for: beaconProximity))
                    .offset(x: 0, y: 0) // Adjust the position as needed
            }
            // Offset for the circle indicator
            .offset(x:380, y:-120)
            
            .onReceive(beaconManager.$proximity) { proximity in
                switch proximity {
                case .immediate:
                    circleColor = .green
                    showItem = true // Show item when proximity is immediate
                case .near:
                    circleColor = .yellow
                    showItem = false // Hide item when proximity is near
                case .far:
                    circleColor = .red
                    showItem = false // Hide item when proximity is far
                case .unknown:
                    circleColor = .gray
                    showItem = false // Hide item when proximity is unknown
                @unknown default:
                    circleColor = .blue // Handle any future unknown cases
                    showItem = false // Hide item when proximity is unknown
                }
            }
            
            .offset(x:0, y:360)
            
            VStack {
                HStack {
                    Image("Button_Back")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 30, alignment: .center)
                        .offset(x: -300, y: 25)
                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    ZStack {
                        // This is for the Title Head Blue
                        Image("TitleHeadBlue_0")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120, alignment: .center)
                            .foregroundStyle(.tint)
                            .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                        
                        Image("Objective")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50, alignment: .center)
                            .offset(x: -330, y: 0)
                            .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                        Image("QuestionMark")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30, alignment: .center)
                            .offset(x: -270, y: -20)
                        Image("SparklesYellow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: 190, y: 20)
                        Image("KacaPembesar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70, alignment: .center)
                            .offset(x: 250, y: 15)
                            .shadow(color: Color.wmsYellow, radius: 0, x: 5, y: 5)
                        Text("Find the missing item!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.wmsDarkBrown)
                            .font(.custom("Poppins-Bold", size: 24))
                            .offset(x: 0, y: 22)
                    }
                }
                
                .offset(x: -35, y: -70)
            
            HStack {
                ZStack {
                    //Target Item: Boni's Tumbler Box
                    Image("Rectangle_TargetItem_small")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    //                .offset(x: 330, y: -450)
                        .shadow(color: Color.wmsBlueDark, radius: 0, x: 5, y: 5)
//                    Image("Button_QuestionMark")
//                        .resizable()
//                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .offset(x: 120, y: -30)
//                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    Image("TumblerMissing")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .rotationEffect(Angle(degrees: -15))
                        .offset(x: 0, y: -7)
//                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    
                    Text("?")
                        .offset(x: 0, y: -7)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.wmsDarkBrown)
                        .font(.custom("Poppins-ExtraBold", size: 30))
                        .padding(.top, 0)
                    
                    ZStack {
                        Image("InfoButton_TumblerCount")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
  // Item Counter
                    Text("\(itemCount)/1") // Must be linked to collect item
                        .offset(x: 0, y: 0)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.wmsDarkBrown)
                        .font(.custom("Poppins-ExtraBold", size: 22))
                        .padding(.top, 0)
                    }
                    .offset(x: 0, y: 50)
                }
                .offset(x: -130, y: -10)
                
                
                Spacer().frame(height: 500)
                
                ZStack {
// Boni Message box
                    Image("MessageBox_Long")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 270, height: 100, alignment: .center)
                        .shadow(color: Color.wmsYellow, radius: 0, x: 5, y: 5)
                    Text(messageText)
                    .multilineTextAlignment(.leading)
                    .offset(x: 0, y: -10)
                    .frame(width: 410, height: 40, alignment: .center)
                    .foregroundColor(.wmsDarkBrown)
                    .font(.custom("Poppins-SemiBold", size: 16))
                    
                    Image("Sender_Boni")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40, alignment: .center)
                    //                .offset(x: 270, y: -470)
                        .offset(x: -170, y: -45)
                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    Image(messageImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70, alignment: .center)
                    //                .offset(x: 420, y: -270)
                        .offset(x:170, y:30)
                        .shadow(color: Color.wmsBlueDark, radius: 0, x: 2, y: 2)
                    
                }
                .offset(x: -230, y: 0)
              
                Spacer().frame(height: 80)
                

            }
            .offset(x: 330, y: -240)
                //    private func circleColor(for proximity: CLProximity) -> Color {
                //        switch proximity {
                //        case .immediate:
                //            return .green
                //        case .near:
                //            return .yellow
                //        case .far:
                //            return .red
                //        default:
                //            return .gray
                //
                //        }
                
// New Gameplay
                
            }
// Conditionally show the item view
            if showItem {
                ShowItemView(onTap: handleItemTap)
            }
            
            // Conditionally show the success page view
            if showSuccessPage {
                SuccessPageView(onReplay: replayGame)
            }
        }
        .onReceive(beaconManager.$proximity) { proximity in
            handleProximityChange(proximity)
        }
    }
    
    private func handleProximityChange(_ proximity: CLProximity) {
        switch proximity {
        case .immediate:
            messageText = "That's my tumbler!"
            messageImage = "Boni_Happy"
            showItem = true // Show item when proximity is immediate
            print("here")
        case .near:
            messageText = "I think it's around here!"
            messageImage = "Boni_SmileOpen"
            showItem = false // Hide item when proximity is near
            print("near")
        case .far:
            messageText = "I've been here before but not too sure"
            messageImage = "Boni_Worry"
            showItem = false // Hide item when proximity is far
            print("far")
        case .unknown:
            messageText = "I don't think it's here"
            messageImage = "Boni_Worry"
            showItem = false // Hide item when proximity is unknown
            print("undetected")
        @unknown default:
            messageText = "I don't think it's here"
            messageImage = "Boni_Worry"
            showItem = false // Hide item when proximity is unknown
        }
    }
    
    private func handleItemTap() {
        withAnimation {
            showItem = false
            showSuccessPage = true
            itemCount = 1
        }
    }
    
    private func replayGame() {
        withAnimation {
            showSuccessPage = false
            itemCount = 0
            // Reset other game state if needed
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(beaconProximity: .constant(.unknown))
    }
}
struct ShowItemView: View {
    var onTap: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Boni's Tumbler")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 20))
                    .padding()
                Spacer().frame(height: 40)
                Image("Tumbler_Boni")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        onTap()
                        
            
                    }
            }
//            .padding()
////            .background(Color.white)
//            .cornerRadius(20)
//            .border(Color.wmsDarkBrown)
//            .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
        }
    }
}

struct SuccessPageView: View {
    var onReplay: () -> Void

    var body: some View {
        VStack {
            Text("You found Boni's Tumbler!")
                .font(.custom("Poppins-Bold", size: 24))
                .foregroundColor(.wmsDarkBrown)
                .padding()
            Button(action: {
                onReplay()
            }) {
                Text("Play Again")
                    .font(.custom("Poppins-Bold", size: 18))
                    .padding()
                    .background(Color.wmsYellow)
                    .foregroundColor(.white)
                    .border(Color.wmsDarkBrown)
                    .cornerRadius(100)
                    .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
            }
        }
        .padding()
        .background(Color.wmsWhite)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
