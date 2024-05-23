//
//  GameView.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 21/05/24.
//

import SwiftUI
import AVFoundation


struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            
    }
}

struct GameView: View {
    @StateObject var beaconManager = BeaconManager()
    @State private var backgroundColor: Color = .white
    
    @StateObject private var cameraController = CameraController()
    
    var body: some View {
        ZStack {
            GridBackground()
            // Camera view should be always on
            CameraView(cameraController: cameraController, cornerRadius: 20, borderWidth: 8, borderColor: Color.wmsDarkBrown)
                .frame(width: 500, height: 530)
                .shadow(color: Color.wmsBlueDark, radius: 0, x: 8, y: 8)
                .offset(x: -140, y:15)
                .padding()
                .onAppear {
                    //                    cameraController.session?.startRunning()
                }
            VStack {
                HStack {
                    Image("Button_Back")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 70, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                        //                .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                        Image("SparklesYellow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: 190, y: 20)
                        //                .shadow(color: Color.wmsYellow, radius: 0, x: 5, y: 5)
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
                        //                    .padding(.top, 60)
                            .offset(x: 0, y: 22)
                        
                    }
                    //            .position(x: UIScreen.main.bounds.width/2,y:50)
                    
                }
                .offset(x:0, y:-330)
            }
            
            VStack {
                ZStack {
                    //Target Item: Boni's Tumbler Box
                    Image("Rectangle_TargetItem")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //                .offset(x: 330, y: -450)
                        .shadow(color: Color.wmsBlueDark, radius: 0, x: 5, y: 5)
                    Image("Button_QuestionMark")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: 120, y: -30)
                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    Image("TumblerMissing")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 55, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .rotationEffect(Angle(degrees: -15))
                        .offset(x: -100, y: 0)
                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    Text("Boni’s tumbler")
                        .offset(x: 20, y: -30)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.wmsDarkBrown)
                        .font(.custom("Poppins-Bold", size: 20))
                        .padding(.top, 60)
                }
                Spacer().frame(height: 90)
                ZStack {
                    // Boni Message box
                    Image("MessageBox")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 270, height: 100, alignment: .center)
                        .shadow(color: Color.wmsYellow, radius: 0, x: 5, y: 5)
                    Text("""
Message....................
.....................
hello gys
""")
                    .multilineTextAlignment(.leading)
                    .offset(x: 0, y: -30)
                    .frame(width: 210, height: 120, alignment: .leading)
                    .foregroundColor(.wmsDarkBrown)
                    .font(.custom("Poppins-SemiBold", size: 16))
                    
                    Image("Sender_Boni")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50, alignment: .center)
                    //                .offset(x: 270, y: -470)
                        .offset(x: -70, y: -110)
                        .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    Image("Boni_SmileOpen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80, alignment: .center)
                    //                .offset(x: 420, y: -270)
                        .offset(x:90, y:60)
                        .shadow(color: Color.wmsBlueDark, radius: 0, x: 3, y: 3)
                    
                }
                Spacer().frame(height: 80)
                VStack {
                    // Button Collect and Cancel
                    Button(action: {}){
                        Image("Button_Collect")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70/*@END_MENU_TOKEN@*/, height: 70, alignment: /*@START_MENU_TOKEN@*/.center)
                        //                    .offset(x: 0, y: 0)
                            .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    }.buttonStyle(ScaleButtonStyle())
                  
                    Button(action: {}){
                        Image("Button_Cancel")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: /*@START_MENU_TOKEN@*/70/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(x: 0, y: 0)
                            .shadow(color: Color.wmsDarkBrown, radius: 0, x: 5, y: 5)
                    }
                   
                    
                }
                
            }
            
            .offset(x: 330, y: 15)
            
            
            //        .padding(.all)
            
        }
    }
}
#Preview {
    GameView()
}
