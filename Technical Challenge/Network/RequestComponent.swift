import Foundation
import Alamofire
class RequestComponent {
    
    static let sharesInstance = RequestComponent()
    
    func headerComponent(_ component: [RequestHeader]) -> HTTPHeaders{
        var header = HTTPHeaders()
        
        header["Authorization"] = "Bearer "
        
        header["Content-Type"] = "application/json"
        header["device_type"] = "ios"
        // header["lang"] = UserService.sharesInstance.appLanguage
        header["Content-Type"] = "application/json"
        header["version"] = "4"
        return header
    }
}

