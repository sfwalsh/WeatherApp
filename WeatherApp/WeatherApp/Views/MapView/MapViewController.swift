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
    
    private let annotationIdentifier = "Annotation"
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
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    func setupTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(didTapMapView))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        mapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func presentView(view: UIViewController, routeType: RouteType) {
        switch routeType {
        case .push:
            navigationController?.pushViewController(view, animated: true)
        case .present:
            (navigationController ?? self).present(view, animated: true, completion: nil)
        }
    }
    
    @objc private func didTapMapView(gestureRecognizer: UIGestureRecognizer) {
        let tapPoint = gestureRecognizer.location(in: mapView)
        let tapCoordinate = mapView.convert(tapPoint, toCoordinateFrom: mapView)
        presenter.didTapLocation(atCoordinate: tapCoordinate)
    }
}

