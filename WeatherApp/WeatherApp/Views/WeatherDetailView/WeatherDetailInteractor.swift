
import Foundation
import CoreLocation

final class WeatherDetailInteractor {
    
    private struct Keys {
        static let owmKey = "45dd31923961a1525dd2ad83f4bf2fd4"
        static let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    }
    
    private let coordinates: CLLocationCoordinate2D
    
    private var params: [String: String] {
        return ["lat": "\(coordinates.latitude)",
                "lon": "\(coordinates.longitude)",
                "appid": Keys.owmKey]
    }
    
    init(withCoordinates coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
    
    func fetchWeather(completion: @escaping ((Weather?) -> Void)) {
        guard let urlRequest = createURLRequest() else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, _, error) in
            guard let data = data,
                error == nil,
                let weather = self?.parseWeatherData(data: data) else {
                completion(nil)
                    return
            }
            completion(weather)
        }.resume()
    }
    
    private func parseWeatherData(data: Data) -> Weather? {
        return try? JSONDecoder().decode(Weather.self, from: data)
    }
    
    func createURLRequest() -> URLRequest? {
        var urlComponents = URLComponents(string: Keys.baseURL)
        
        let queryItems: [URLQueryItem] = params.map({ URLQueryItem(name: $0.key,
                                                                   value: $0.value)})
            .filter({ !$0.name.isEmpty })
        
        if !queryItems.isEmpty {
            urlComponents?.queryItems = queryItems
        }
        
        guard let url = urlComponents?.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

}
