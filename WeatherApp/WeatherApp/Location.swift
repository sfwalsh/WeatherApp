
import Foundation

struct Location {
    let name: String
    let countryCode: String
    
    init?(name: String?,
          countryCode: String?) {
        guard let name = name,
            let countryCode = countryCode else {
            return nil
        }
        
        self.name = name
        self.countryCode = countryCode
    }
}
