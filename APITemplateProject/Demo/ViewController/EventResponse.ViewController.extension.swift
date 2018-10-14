//
//  EventResponse.ViewController.extension.swift
//  APITemplateProject
//
//  Created by casa's script
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
