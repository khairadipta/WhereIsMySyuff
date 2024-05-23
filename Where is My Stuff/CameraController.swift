//
//  CameraController.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 22/05/24.
//

import UIKit
import AVFoundation

class CameraController: NSObject, ObservableObject {
    @Published var session: AVCaptureSession?

    override init() {
        super.init()
        setupCamera()
    }

    private func setupCamera() {
        session = AVCaptureSession()
        session?.sessionPreset = .photo

        guard let backCamera = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: backCamera) else {
            print("Unable to access back camera!")
            return
        }

        let output = AVCaptureVideoDataOutput()
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]

        session?.addInput(input)
        session?.addOutput(output)
        
        session?.startRunning()
    }
}



