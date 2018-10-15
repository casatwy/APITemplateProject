//
//  CharactorViewController.swift
//  MarvelAPI
//
//  Created by casa on 2018/9/27.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import APIDemoSuite
import CTNetworkingSwift

class __GroupName__ViewController: DemoSuiteBaseAPIViewController, DemoSuiteBaseAPIViewControllerChild {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        child = self
    }
    
    func params(for apiManager: CTNetworkingBaseAPIManager) -> ParamsType? {
        // if let _apiManager = apiManager as? CTMarvelCharactorsAPIManager {
        //     return _apiManager.generateParams(name: nil, nameStartsWith: "b", modifiedSince: nil, comics: nil, series: nil, events: nil, stories: nil, orderBy: .nameAsc)
        // }
        return nil
    }
    
    let dataSource = [
        [
            // DemoSuiteBaseAPIViewController.DataSourceKey.APIManagerTitle:"Marvel Character List",
            // DemoSuiteBaseAPIViewController.DataSourceKey.APIManagerClass:CTMarvelCharactorsAPIManager.self
            // __DemoAPIManager__
        ]
    ]
    
}
