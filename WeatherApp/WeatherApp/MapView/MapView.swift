
import Foundation
import MapKit

protocol MapView: class {
    func setupMapView()
    func setupTapGestureRecognizer()
    func updateMapRegion(to region: MKCoordinateRegion)
}
