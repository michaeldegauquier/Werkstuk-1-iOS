//
//  TweedeViewController.swift
//  Werkstuk1
//
//  Created by student on 06/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

// Stackoverflow. How do I remove all map annotations. Geraadpleegd via
// https://stackoverflow.com/questions/32850094/how-do-i-remove-all-map-annotations-in-swift-2
// Geraadpleegd op 7 april 2019

// Stackoverflow. How to reload a view controller when back from another view using tab bar. Geraadpleegd via
// https://stackoverflow.com/questions/46577217/how-to-reload-a-view-controller-when-back-from-another-view-using-tab-bar
// Geraadpleegd op 7 april 2019

import UIKit
import CoreLocation
import MapKit

class TweedeViewController: UIViewController, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadView()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let allAnnotations = self.myMapView.annotations
        self.myMapView.removeAnnotations(allAnnotations)
        
        for item in items {
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: item.gpsCoordinaten[0], longitude: item.gpsCoordinaten[1])
            let annotation:AnnotationFriends = AnnotationFriends(coordinate: coordinate, title: item.voornaam!)
            self.myMapView.addAnnotation(annotation)
            self.myMapView.selectAnnotation(annotation, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
