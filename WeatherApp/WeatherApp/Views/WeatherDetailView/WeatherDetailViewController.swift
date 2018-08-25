
import UIKit
import CoreLocation

class WeatherDetailViewController: UIViewController, WeatherDetailView, StoryboardInstantiable {
    
    
    static let viewControllerIdentifier: String = "WeatherDetailViewController"
    static let storyboardIdentifier: String = "WeatherDetail"
    
    static func newInstance(withCoordinates coordinates: CLLocationCoordinate2D) -> WeatherDetailViewController? {
        guard let viewController = newInstance() else { return nil }
        let presenter = WeatherDetailPresenter(with: viewController,
                                               coordinates: coordinates)
        viewController.setupPresenter(with: presenter)
        return viewController
    }
    
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var locationSubtitleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    private var presenter: WeatherDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func setupPresenter(with presenter: WeatherDetailPresenter) {
        self.presenter = presenter
    }
    
    func presentErrorAlert(withText text: String) {
        // FIXME
    }
    
    func setup(with locationTitle: String?,
               locationCountry: String?,
               temperature: String?,
               weatherStatus: String?) {
        locationTitleLabel.text = locationTitle
        locationSubtitleLabel.text = locationCountry
        temperatureLabel.text = temperature
        weatherStatusLabel.text = weatherStatus
    }

}
