//
//  ViewController.swift
//  APITemplateProject
//
//  Created by casa's script
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var environmentSegment : UISegmentedControl = {
        let _segment = UISegmentedControl(items: ["Develop", "preRelease", "Release"])
        _segment.selectedSegmentIndex = __ServiceName__.sharedInstance.apiEnvironment.rawValue
        _segment.addTarget(self, action: #selector(didChangedEnvironmentSegment(_:)), for: .valueChanged)
        return _segment
    }()
    
    lazy var tableView : UITableView = {
        let _tableView = UITableView(frame: .zero, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.tableFooterView = UIView()
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    lazy var dataSource : [[String:Any]] = [
        // [
            // DataSourceKey.title:"CharacterAPI",
            // DataSourceKey.clazz:CharactorViewController.self
        // ],

        //__DemoAPIViewController__
    ]

    struct DataSourceKey {
        static let title = "title"
        static let clazz = "class"
    }
}
