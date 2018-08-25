
import Foundation
import MapKit

final class MapViewPresenter {
    
    private weak var view: MapView?
    private let interactor: MapViewInteractor
    
    init(with view: MapView?) {
        self.interactor = MapViewInteractor()
        self.view = view
    }
    
    func viewDidLoad() {
        performInitialSetup()
    }
    
    func didTapLocation(atCoordinate coordinate: CLLocationCoordinate2D) {
        
    }
    
    private func performInitialSetup() {
        view?.setupMapView()
        view?.setupTapGestureRecognizer()
        interactor.performInitialSetup()
        fetchUserLocation()
    }
    
    private func fetchUserLocation() {
        interactor.fetchUserLocation { [weak self] (userLocationCoordinate) in
            let region = MKCoordinateRegion(center: userLocationCoordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.26,
                                                                longitudeDelta: 0.26))
            self?.view?.updateMapRegion(to: region)
        }
    }
}
