//
//  CameraView.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 22/05/24.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    @ObservedObject var cameraController: CameraController
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderColor: Color

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black

        if let session = cameraController.session {
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = viewController.view.frame
            switch UIDevice.current.orientation {
            case .unknown:
                break
            case .portrait:
                previewLayer.connection?.videoOrientation = .portrait

            case .portraitUpsideDown:
                previewLayer.connection?.videoOrientation = .portraitUpsideDown

            case .landscapeLeft:
                previewLayer.connection?.videoOrientation = .landscapeLeft
            case .landscapeRight:
                previewLayer.connection?.videoOrientation = .landscapeRight
            default:
                break
            }
            viewController.view.layer.addSublayer(previewLayer)
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let session = cameraController.session {
            if let previewLayer = uiViewController.view.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
                previewLayer.session = session
                previewLayer.frame = uiViewController.view.bounds
            }
        }

        // Apply corner radius and border
        uiViewController.view.layer.cornerRadius = cornerRadius
        uiViewController.view.layer.borderWidth = borderWidth
        uiViewController.view.layer.borderColor = UIColor(borderColor).cgColor
        uiViewController.view.clipsToBounds = true
    }
}

