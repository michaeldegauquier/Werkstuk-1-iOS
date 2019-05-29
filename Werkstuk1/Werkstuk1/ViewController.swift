//
//  ViewController.swift
//  Werkstuk1
//
//  Created by student on 06/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

// Stackoverflow. How can I make an image full screen when clicked and then original size when clicked again? Geraadpleegd via
// https://stackoverflow.com/questions/34694377/swift-how-can-i-make-an-image-full-screen-when-clicked-and-then-original-size
// Geraadpleegd op 7 april 2019

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var item = Persoon()
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapViewPerson: MKMapView!
    
    @IBOutlet weak var voornaam: UILabel!
    
    @IBOutlet weak var naam: UILabel!
    
    @IBOutlet weak var telefoon: UILabel!
    
    @IBOutlet weak var adres: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 134.850890, longitude: 5.347503)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.voornaam.text = item.voornaam
        self.naam.text = item.naam
        self.telefoon.text = item.telefoonnummer
        self.adres.text = item.adres.ToString()
        self.imageview.image = UIImage(named: item.foto)
        
        //locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: coordinate.latitude, longitudeDelta: coordinate.longitude))
        
        mapView.setRegion(region, animated: false)
    }
    
    
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.mapViewPerson?.isHidden = true
        
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.mapViewPerson?.isHidden = false
        sender.view?.removeFromSuperview()
    }
}

