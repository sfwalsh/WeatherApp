
import Foundation
import CoreLocation

final class WeatherDetailInteractor {
    
    private let coordinates: CLLocationCoordinate2D
    
    init(withCoordinates coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
}
