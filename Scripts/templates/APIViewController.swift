//
//  __GroupName__APIViewController.swift
//  ____ProjectName____
//
//  Created by casa's script
//  Copyright © ____YEAR____ casa. All rights reserved.
//

import UIKit
import APIDemoSuite
import CTNetworkingSwift

class __GroupName__APIViewController: DemoSuiteBaseAPIViewController, DemoSuiteBaseAPIViewControllerChild {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        child = self
    }
    
    func params(for apiManager: CTNetworkingBaseAPIManager) -> ParamsType? {
        if let _apiManager = apiManager as? __APIManagerFileName__ {
             return _apiManager.generateParams()
        }
        //__DemoAPIManagerParamSource__
        return nil
    }
    
    let dataSource : [[String:Any]] = [
        [
            DemoSuiteBaseAPIViewController.DataSourceKey.APIManagerTitle:"__Title__",
            DemoSuiteBaseAPIViewController.DataSourceKey.APIManagerClass:__APIManagerFileName__.self
        ],
        //__DemoAPIManagerDataSourceItem__
    ]
    
}
