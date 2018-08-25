
import Foundation
import CoreLocation

final class WeatherDetailInteractor {
    
    private struct Keys {
        static let owmKey = "45dd31923961a1525dd2ad83f4bf2fd4"
    }
    
    private let coordinates: CLLocationCoordinate2D
    
    init(withCoordinates coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
    
    func fetchWeather(completion: (() -> Void)) {
        
    }
}
