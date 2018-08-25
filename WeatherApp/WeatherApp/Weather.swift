
import Foundation

private struct RawWeatherResponse: Decodable {
    struct SysInfo: Decodable {
        let country: String?
    }
    
    struct WeatherInfo: Decodable {
        let main: String?
        let description: String?
    }
    
    struct MainInfo: Decodable {
        let temp: Double
    }
    //    {"coord":{"lon":-6.26,"lat":53.35},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"base":"stations","main":{"temp":288.59,"pressure":1016,"humidity":51,"temp_min":288.15,"temp_max":289.15},"visibility":10000,"wind":{"speed":3.6,"deg":270},"clouds":{"all":40},"dt":1535200200,"sys":{"type":1,"id":5237,"message":0.0128,"country":"IE","sunrise":1535174580,"sunset":1535225387},"id":2962486,"name":"Mountjoy","cod":200}
    
    let sys: SysInfo
    let weather: [WeatherInfo]
    let name: String
    let main: MainInfo
}

struct Weather: Decodable {
    
    private struct K {
        static let celsiusKelvinOffset: Double = 273.15
        static let fahrenheitKelvinOffset: Double = -459.67
    }
    
    let location: Location?
    let temperature: Double?
    let title: String?
    let subtitle: String?
    
    func temperatureDisplayString(forLocale locale: Locale) -> String? {
        guard let temperature = temperature else {
            return nil
        }
        
        if locale.usesMetricSystem {
            return "\(temperature - K.celsiusKelvinOffset) ºC"
        } else {
            return "\(temperature - K.fahrenheitKelvinOffset) ºF"
        }
    }
    
    init(from decoder: Decoder) throws {
        let raw = try? RawWeatherResponse(from: decoder)
        self.title = raw?.weather.first?.main
        self.subtitle = raw?.weather.first?.description
        self.temperature = raw?.main.temp
        self.location = Location(name: raw?.name,
                                 countryCode: raw?.sys.country)
    }
}
