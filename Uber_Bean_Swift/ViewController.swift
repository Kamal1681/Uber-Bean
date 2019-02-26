//
//  ViewController.swift
//  Uber_Bean_Swift
//
//  Created by Kamal Maged on 2019-02-26.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    let cLLManager = CLLocationManager()
 
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cLLManager.delegate = self
        cLLManager.requestWhenInUseAuthorization()
        cLLManager.requestLocation()
    
        mapView.showsUserLocation = true
    
        //mapView.region
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        print("Errur")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var currentLocation = locations.first
        if currentLocation != nil {
           print("location updating!\(currentLocation)")
            let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let mapRegion = MKCoordinateRegion.init(center: (currentLocation?.coordinate)!, span: mapSpan)
            mapView.region = mapRegion
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let status = CLLocationManager.authorizationStatus()
        if  status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse {

            manager.startUpdatingLocation()
        }
    }
    


}

