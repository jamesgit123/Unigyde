//
//  MapViewController.swift
//  Unigyde
//
//  Created by XCodeClub on 1/15/17.
//  Copyright © 2017 Unigyde. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var map: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let UserLocation:CLLocation = locations[0]
        let latitude:CLLocationDegrees = UserLocation.coordinate.latitude
        let longitude:CLLocationDegrees = UserLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.05
        let lonDelta:CLLocationDegrees = 0.05
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location,span)
        map.setRegion(region,animated: false)
        
        let pin = MKPointAnnotation()
        pin.coordinate.latitude = UserLocation.coordinate.latitude
        pin.coordinate.longitude = UserLocation.coordinate.longitude
        pin.title = "Your Location"
        map.addAnnotation(pin)
    }
    
    @IBAction func `switch`(_ sender: Any) {
        
        switch segment.selectedSegmentIndex{
            
        case 0:
            map.mapType = MKMapType.standard
            break
            
        case 1:
            map.mapType = MKMapType.satellite
            break
            
        case 2:
            map.mapType = MKMapType.hybrid
            break
            
        case 4:
            map.mapType = MKMapType.hybridFlyover
            break
        case 3:
            map.mapType = MKMapType.satelliteFlyover
            
        default:
            break
        }
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
