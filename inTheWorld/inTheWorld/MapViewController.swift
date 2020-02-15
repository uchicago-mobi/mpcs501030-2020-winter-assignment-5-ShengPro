//
//  MapViewController.swift
//  inTheWorld
//
//  Created by Shengsheng Xu on 2/14/20.
//  Copyright © 2020 Shengsheng Xu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoName: UILabel!
    @IBOutlet weak var infoDescrip: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    //changed every time a place is selected, used as an short cut to access the place selected
    var selectedPlace : Place = Place()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize the mapView
        mapView.showsCompass = false
        mapView.pointOfInterestFilter = .excludingAll
        mapView.delegate = self
        // use Datamanager load the region and set, register the annation view
        mapView.setRegion(DataManager.sharedInstance.loadRegion(), animated: true)
        mapView.register(PlaceMarkerView.self, forAnnotationViewWithReuseIdentifier: "Place")
        
        // get the static variable places, which store all the place in data.plist
        let places = DataManager.places
        for place in places {
            mapView.addAnnotation(place) //create and add anation, find the Wrigley Field and select it
            if place.name == "Wrigley Field" {
                mapView.selectAnnotation(place, animated: true)
            }
        }
    }
    
    //this function receive an place and make map zomm at it, called every time get notified by the favorite view controller
    func zoomPlace(place: Place) {
        let miles : Double = 10 * 10 // region span
        let region = MKCoordinateRegion.init(center: place.coordinate, latitudinalMeters: miles, longitudinalMeters: miles)
        mapView.setRegion(region, animated: true)
    }
    
    // this function will update the information label according to the argument place.
    func updateInfoView(place : Place) {
        // get the favorite places from the UserDefaults
        let favPlaces = DataManager.sharedInstance.listFavorites()
        // update the selectedPlace, make sure the information match the info view
        self.selectedPlace = place
        infoName.text = place.name
        infoDescrip.text = place.longDescription
        if favPlaces.contains(selectedPlace.name!) {
            favoriteButton.isSelected = true
        }else {
            favoriteButton.isSelected = false
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionation = segue.destination as? FavoritesViewController {
            // to get notified by the favorite vc, first we need to set the delegate of fav vc as self
            destionation.delegate = self
        }
    }
    // every time star button tapped, update the fav places stored in the user defaults
    @IBAction func starButtonTaped(_ sender: UIButton) {
        let favPlaces = DataManager.sharedInstance.listFavorites()
        if favPlaces.contains(selectedPlace.name!) {
            DataManager.sharedInstance.deleteFavorite(place: selectedPlace)
            sender.isSelected = false
        }else {
            DataManager.sharedInstance.saveFavorites(place: selectedPlace)
            sender.isSelected = true
        }
    }
    
}

// Delegate for mapView
extension MapViewController: MKMapViewDelegate {
    // When annotation selected
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let place = view.annotation as! Place
        updateInfoView(place: place)
    }
}

//
extension MapViewController: PlacesFavoriteDelegate {
    func favoritePlace(name: String) {
        if let place = DataManager.sharedInstance.getPlaceByName(name: name) {
            zoomPlace(place: place)
            updateInfoView(place: place)
        }
    }
}
