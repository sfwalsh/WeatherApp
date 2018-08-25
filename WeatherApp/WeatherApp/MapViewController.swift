//
//  ViewController.swift
//  WeatherApp
//
//  Created by Stephen Walsh on 25/08/2018.
//  Copyright © 2018 Stephen Walsh. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MapView, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var presenter: MapViewPresenter!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.presenter = MapViewPresenter(with: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func updateMapRegion(to region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: true)
    }
    
    func setupMapView() {
        mapView.showsUserLocation = true
    }
}

