//
//  LifeCycle.ViewController.extension.swift
//  MarvelAPI
//
//  Created by casa on 2018/9/27.
//  Copyright © 2018 casa. All rights reserved.
//

import SwiftHandyFrame

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.addSubview(environmentSegment)
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.ct_fill()
        
        if let navigationBar = navigationController?.navigationBar {
            environmentSegment.sizeToFit()
            environmentSegment.ct_setCenterEqualToView(navigationBar)
            environmentSegment.ct_setInnerRightGap(8, shouldResize: false)
        }
    }
}
