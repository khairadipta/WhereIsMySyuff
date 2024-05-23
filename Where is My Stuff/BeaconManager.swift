//
//  BeaconManager.swift
//  Where is My Stuff
//
//  Created by Khai Dipta on 22/05/24.
//

import Foundation
import CoreLocation
import Combine

class BeaconManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    let locationManager = CLLocationManager()
    let uuidString = "34C233A1-06FA-4B27-8677-B8131869EBBF"
    var constraint: CLBeaconIdentityConstraint!
    
    @Published var proximity: CLProximity = .unknown
    
    override init() {
        super.init()
        
        if let uuid = UUID(uuidString: uuidString) {
            constraint = CLBeaconIdentityConstraint(uuid: uuid)
            let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "LocationMy")
            
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startRangingBeacons(satisfying: beaconRegion.beaconIdentityConstraint)
        } else {
            print("Invalid UUID string")
            // Handle the case when UUID string is invalid
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLBeaconRegion {
            print("Entered beacon region!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLBeaconRegion {
            print("Exited beacon region!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            self.proximity = beacon.proximity
        }
    }
}
