//
//  PlaceMarkerView.swift
//  inTheWorld
//
//  Created by Shengsheng Xu on 2/14/20.
//  Copyright © 2020 Shengsheng Xu. All rights reserved.
//

import UIKit
import MapKit

class PlaceMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
          clusteringIdentifier = "Place"
          displayPriority = .defaultLow
          markerTintColor = .systemRed
          glyphImage = UIImage(systemName: "pin.fill")
          }
    }

}
