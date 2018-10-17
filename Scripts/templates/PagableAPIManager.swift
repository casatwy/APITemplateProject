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
    
    var _pageSize = 20
    var _isFirstPage = true
    var _isLastPage = false
    var _currentPageNumber = 0
    var _totalCount : Int? = nil

    public override func loadData() {
        _currentPageNumber = 0
        _isFirstPage = true
        _isLastPage = false
        super.loadData()
    }
}

extension __APIManagerFileName__ : CTNetworkingBaseAPIManagerChild {
    public var isPagable : Bool {
        return true
    }
    
    public var service: CTNetworkingService {
        return __ServiceName__.sharedInstance
    }
    
    public var methodName : String {
        return "__MethodName__"
    }
    
    public var requestType : HTTPMethod {
        return .__HTTPMethod__
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

extension __APIManagerFileName__ : CTNetworkingAPIManagerPagable {
    public var isFirstPage : Bool {
        return _isFirstPage
    }
    
    public var isLastPage : Bool {
        return _isLastPage
    }
    
    public var currentPageNumber : Int {
        return _currentPageNumber
    }
    
    public var pageSize : Int {
        return _pageSize
    }
    
    public var totalCount : Int? {
        return _totalCount
    }
    
    public func loadNextPage() {
        guard isLastPage == false else { return }
        guard isLoading == false else { return }
        _currentPageNumber += 1
        super.loadData()
    }
}

extension __APIManagerFileName__ {
    
    public func generateParams(__ParamList__) -> [String:String] {
        var params = [String:String]()
        // params["name"] = name
        // __ParamsToDict__
        return params
    }
    
    public override func beforePerformSuccess(_ apiManager: CTNetworkingBaseAPIManager) -> Bool {
        
        guard let shouldContinue = interceptor?.beforePerformSuccess(self), shouldContinue == false { return false }
        // 在这里写翻页逻辑

    }
    
    public override func beforePerformFail(_ apiManager: CTNetworkingBaseAPIManager) -> Bool {
        if let shouldContinue = interceptor?.beforePerformFail(self), shouldContinue == false { return false }
        _currentPageNumber -= 1
        _isFirstPage = (_currentPageNumber == 0)
        return true
    }
}


