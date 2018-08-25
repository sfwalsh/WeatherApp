
import Foundation
import MapKit

protocol MapView: class {
    func setupMapView()
    func updateMapRegion(to region: MKCoordinateRegion)
}
