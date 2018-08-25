
import Foundation

protocol WeatherDetailView: class {
    func presentErrorAlert(withText text: String)
    func setup(with locationTitle: String?,
               locationCountry: String?,
               temperature: String?,
               weatherStatus: String?)
}
