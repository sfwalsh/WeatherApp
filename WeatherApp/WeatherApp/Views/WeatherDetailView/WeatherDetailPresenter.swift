
import Foundation
import CoreLocation

final class WeatherDetailPresenter {

    private weak var view: WeatherDetailView?
    private let interactor: WeatherDetailInteractor
    
    init(with view: WeatherDetailView?,
         coordinates: CLLocationCoordinate2D) {
        self.view = view
        self.interactor = WeatherDetailInteractor(withCoordinates: coordinates)
    }
    
    func viewDidLoad() {

    }
}
