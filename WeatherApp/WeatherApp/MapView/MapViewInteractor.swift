
import Foundation
import CoreLocation

final class MapViewInteractor: NSObject, CLLocationManagerDelegate {
    
    private let locationManager: CLLocationManager
    
    private var userLocationFetchCompletion: ((CLLocationCoordinate2D) -> Void)?
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
    }
    
    func performInitialSetup() {
        setupLocationManager()
        startFetchingLocation()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    private func startFetchingLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func fetchUserLocation(completion: @escaping ((CLLocationCoordinate2D) -> Void)) {
        self.userLocationFetchCompletion = completion
    }
    
    
    // MARK: CLLocationManagerDelegate Implementation
    
    internal func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first else { return }
        
        self.userLocationFetchCompletion?(userLocation.coordinate)
        self.userLocationFetchCompletion = nil
    }
}
