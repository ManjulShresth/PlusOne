//
//  EventPin.swift
//  PlusOne
//
//  Created by Manjul Shrestha on 11/6/17.
//  Copyright © 2017 Manjul Shrestha. All rights reserved.
//

import UIKit
import MapKit

class EventPin: MKPointAnnotation {
    var pinColor: UIColor
    
    init(pinColor: UIColor) {
        self.pinColor = pinColor
        super.init()
    }
}
