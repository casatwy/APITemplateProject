//
//  EventResponse.ViewController.extension.swift
//  MarvelAPI
//
//  Created by casa on 2018/9/27.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import CTNetworkingSwift

extension ViewController {
    @objc func didChangedEnvironmentSegment(_ segmentControl:UISegmentedControl) {
        guard let apiEnvironment = CTNetworkingAPIEnvironment(rawValue: segmentControl.selectedSegmentIndex) else { return }
        __ServiceName__.sharedInstance.apiEnvironment = apiEnvironment
    }
}
