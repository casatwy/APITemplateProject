//
//  UITableView.ViewController.extension.swift
//  APITemplateProject
//
//  Created by casa's script
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let title = dataSource[indexPath.row][DataSourceKey.title] as? String else { return }
        cell.textLabel?.text = title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let clazz = dataSource[indexPath.row][DataSourceKey.clazz] as? UIViewController.Type else { return }
        let viewController = clazz.init()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
