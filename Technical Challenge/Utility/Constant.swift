
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import Foundation

//Typealias
typealias CompletionHandler<T:Decodable> = (_ error:String?,_ code:Int?,T?)->()


// URLS
let BaseURL = "http://data.fixer.io/api/"
let apiKey = "access_key=442a2c9917de4b37764ff7d74d8d7241&"
let allCurrency = BaseURL + "latest?" + apiKey + "&format=1"
let currencyConverURL = BaseURL + "convert?" + apiKey
let header = RequestComponent.sharesInstance.headerComponent([.authorization,.content])
/// UserDefults KEYS
let USER_LOGGED_IN_KEY = "USER_LOGGED_IN_KEY"
let USER_OTP_KEY = "USER_OTP_KEY"
let APP_LANG_KEY = "APP_LANG_KEY"
let USER_TOKEN_KEY = "USER_TOKEN_KEY"
let USER_FMCTOKEN_KEY = "USER_FMCTOKEN_KEY"
let USER_ID_KEY = "USER_ID_KEY"
let USER_NAME_KEY = "USER_NAME_KEY"
let DISPLAY_NAME_KEY = "DISPLAY_NAME_KEY"
let  USER_IMAGE_KEY = "USER_IMAGE_KEY"
let PHONE_NUMBER_KEY = "PHONE_NUMBER_KEY"
let COUNTRY_ID_KEY = "COUNTRY_ID_KEY"
let COUNTRY_CODE_KEY = "COUNTRY_CODE_KEY"
/// StoryBoard IDS

let NAV_HOME_VC_IDENTIFIER = "MainTabBar"
let REGISTRATION_STORYBOARD = ""
let LOGIN_VC_IDENTIFIER = "LOGINVC"

