
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
        fetchWeather()
    }
    
    private func fetchWeather() {
        interactor.fetchWeather { [weak self] (weather) in
            guard let weather = weather else {
                self?.view?.presentErrorAlert(withText: "Could not fetch weather data")
                return
            }
            
            self?.updateView(with: weather)
        }
    }
    
    private func updateView(with weather: Weather) {
        view?.setup(with: weather.location?.name.capitalized,
                    locationCountry: weather.location?.countryCode.uppercased(),
                    temperature: weather.temperatureDisplayString(forLocale: Locale.current),
                    weatherStatus: weather.title)
    }
}
