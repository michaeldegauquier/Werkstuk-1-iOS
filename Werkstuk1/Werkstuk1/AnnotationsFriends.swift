//
//  AnnotationsFriends.swift
//  Werkstuk1
//
//  Created by student on 07/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AnnotationFriends: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    override init() {
        coordinate = CLLocationCoordinate2D()
        title = ""
    }
    
    init (coordinate:CLLocationCoordinate2D, title:String)
    {
        self.coordinate = coordinate
        self.title = title
    }
}
