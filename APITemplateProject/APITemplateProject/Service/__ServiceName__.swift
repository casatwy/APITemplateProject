//
//  CTMarvelService.swift
//  APITemplateProject
//
//  Created by casa's script
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import Alamofire
import CTNetworkingSwift
import CryptoSwift

class __ServiceName__ {
    static let sharedInstance = __ServiceName__()
    lazy var _apiEnvironment: CTNetworkingAPIEnvironment = .Release
    lazy var _sessionManager: SessionManager = SessionManager.default
}

extension CTMarvelService : CTNetworkingService {
    var apiEnvironment: CTNetworkingAPIEnvironment {
        get {
            return _apiEnvironment
        }
        set(newValue) {
            _apiEnvironment = newValue
        }
    }
    
    var sessionManager: SessionManager {
        get {
            return _sessionManager
        }
    }
    
    func request(params: ParamsType?, methodName: String, requestType: HTTPMethod) -> DataRequest {
        // need return DataRequest
    }
    
    func handleCommonError(_ apiManager: CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
}

