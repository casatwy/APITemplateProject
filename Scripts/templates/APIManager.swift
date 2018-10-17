//
//  __APIManagerFileName__.swift
//  ____ProjectName____
//
//  Created by casa's script
//  Copyright © __year__ casa. All rights reserved.
//

import Alamofire
import CTNetworkingSwift

public class __APIManagerFileName__: CTNetworkingBaseAPIManager {

    override init() {
        super.init()
        child = self
        validator = self
    }
    
}

extension __APIManagerFileName__ : CTNetworkingBaseAPIManagerChild {
    public var isPagable : Bool {
        return false
    }
    
    public var service: CTNetworkingService {
        return __ServiceName__.sharedInstance
    }
    
    public var methodName : String {
        return "__MethodName__"
    }
    
    public var requestType : HTTPMethod {
        return .__RequestType__
    }
}

extension __APIManagerFileName__ : CTNetworkingBaseAPIManagerValidator {
    public func isCorrect(manager: CTNetworkingBaseAPIManager, params: ParamsType?) -> CTNetworkingErrorType.Params {
        return .correct
    }
    
    public func isCorrect(manager: CTNetworkingBaseAPIManager, response: DefaultDataResponse) -> CTNetworkingErrorType.Response {
        return .correct
    }
}

extension __APIManagerFileName__ {
    
    public func generateParams(demo:String) -> [String:Any] {
        var params = [String:Any]()
        params["demo"] = demo
        //__ParamsToDict__
        return params
    }
    
}


