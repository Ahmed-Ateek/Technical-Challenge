import Foundation
import Alamofire

class RequestManager {
    // single tone :D
    static let sharesInstance = RequestManager()
    // this func only for sending data and reciving
     let appdelegate = UIApplication.shared.delegate as? AppDelegate
   
    func request<T: Codable>(fromUrl url: String, byMethod method: HTTPMethod, withParameters parameters: [String:Any]?, completion: @escaping CompletionHandler<T>) {
        print("API URL: \(url)")
        let headers = RequestComponent.sharesInstance.headerComponent([])

        AF.request(url, method: method, parameters: parameters,encoding:JSONEncoding.default, headers: headers).responseJSON { (response) in
            let window = self.appdelegate?.window
            let code  = response.response?.statusCode ?? -1
            let result = response.result
            print(result)
            let error = "Oops Error Please Try Again"
            switch result {
            case .success( _):
                if code == 200 || code == 201 || code == 203 {
                    self.handleSuccess(response: response, completion: completion, code: code)
                }else {
                    if ( code == 401 ){
                     
                      
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let goToLogin = storyboard.instantiateViewController(withIdentifier: "LOGINVC")
                      //  UserService.sharesInstance.isLoggedIn = false
                        window?.rootViewController = goToLogin
                    }else if (code == 451){
//                        let alert = UIAlertController(
//                            title: "Force Update".localized(),
//                            message:"update_msg".localized(), preferredStyle: .alert)
//                        let action = UIAlertAction(title: "Update".localized(), style: .default) { (action) in
//                            Utils.openWeb(urlString: "https://apps.apple.com/us/app/khagool/id1541495470")
//                      
//                        }
//                        alert.addAction(action)
//                        window?.rootViewController?.present(alert, animated: true)
                        
                    }
                    else{
                        self.handleError(response: response, completion: completion, code: code, error: error)
                    }
                    
                }
                break
            case .failure(let error):
                completion(error.localizedDescription,ErrorsCodes.requestFailureError.rawValue,nil)
                break
            }
        }
    }
   
    private func handleSuccess<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping CompletionHandler<T>,code:Int) {
        guard let _data = response.data else {
            completion("error occured while handling data, please try again later",ErrorsCodes.castError.rawValue,nil)
            return
        }
        do{
            let data = try JSONDecoder().decode(T.self, from: _data)
            print(data)
            completion(nil, code ,data)
        } catch {
            completion("error in decoding, please try again later \(error.localizedDescription)",ErrorsCodes.codableError.rawValue,nil)
        }
    }
    
    private func handleError<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping CompletionHandler<T>,code:Int,error:String) {
        guard let _data = response.data else {
            completion("error occured while handling data, please try again later",ErrorsCodes.castError.rawValue,nil)
            return
        }
        do{
            let data = try JSONDecoder().decode(T.self, from: _data)
            print(data)
            completion(error , code , data)
        } catch{
            completion("error in decoding, please try again later \(error.localizedDescription)",ErrorsCodes.codableError.rawValue,nil)
        }
    }
    
    
    /// call fire base to upload photo
//    func uploadMedia(image:UIImage,completion: @escaping (_ url: String?) -> Void) {
//        let time :String = "\(Timestamp().nanoseconds).png"
//        let storageRef =    Storage.storage().reference().child("MyImages").child(time)
//        if let uploadData = image.pngData() {
//            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
//                if error != nil {
//                    print("error")
//                    completion(nil)
//                } else {
//                    storageRef.downloadURL(completion: { (url, error) in
//                        completion(url?.absoluteString.description ?? "")
//                       
//                    })
//                 
//                }
//               
//            }
//        }}
}
