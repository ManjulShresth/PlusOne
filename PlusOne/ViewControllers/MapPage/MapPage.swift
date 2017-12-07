//
//  MapPage.swift
//  PlusOne
//
//  Created by Manjul Shrestha on 11/1/17.
//  Copyright © 2017 Manjul Shrestha. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapPage: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var myMapView: MKMapView!
    let locationManager = CLLocationManager()
    let newPin = MKPointAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let lat : CLLocationDegrees = 39.6475510
        let longe : CLLocationDegrees = -79.9726230
        let center = CLLocationCoordinate2D(latitude: lat, longitude: longe)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        newPin.coordinate = center
        
        self.myMapView.addAnnotation(newPin)
        self.myMapView.setRegion(region, animated: true)
        
        let lat1 : CLLocationDegrees = 39.648179
        let longe1 : CLLocationDegrees = -79.970920
        let center1 = CLLocationCoordinate2D(latitude: lat1, longitude: longe1)
        let event1Pin = EventPin(pinColor: UIColor.green)
        event1Pin.coordinate = center1
        self.myMapView.addAnnotation(event1Pin)

        
        let lat2 : CLLocationDegrees = 39.646370
        let longe2 : CLLocationDegrees = -79.974643
        let center2 = CLLocationCoordinate2D(latitude: lat2, longitude: longe2)
        let event2Pin = EventPin(pinColor: UIColor.green)
        event2Pin.coordinate = center2
        self.myMapView.addAnnotation(event2Pin)



        
        locationManager.startUpdatingLocation()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - CLLocationDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        
        let lat : CLLocationDegrees = 51.5033640
        let longe : CLLocationDegrees = -0.1276250
        
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let center = CLLocationCoordinate2D(latitude: lat, longitude: longe)

        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        //self.myMapView.map.setRegion(region, animated: true)
        self.myMapView.setRegion(region, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
