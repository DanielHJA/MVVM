//
//  BaseTableViewController.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class BaseTableViewController<T: BaseTableViewCell<O>, O, VM: BaseViewModel>: BaseViewController<VM>, UITableViewDelegate, UITableViewDataSource {
    
    private var didRegisterCells: Bool = false
    
    var items = [[O]]() {
        didSet {
            if didRegisterCells {
                tableView.reloadData()
            } else {
                registerTableViewCells()
                didRegisterCells = true
            }
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            loading(isLoading)
        }
    }
    
    var loadingView: LoadingView = LoadingView()
    
    lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.delegate = self
        temp.dataSource = self
        temp.tableFooterView = UIView()
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        return temp
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { return UITableViewCell() }
        let item = items[indexPath.section][indexPath.row]
        cell.setupWithObject(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func registerTableViewCells() {
        tableView.register(T.self, forCellReuseIdentifier: T.identifier)
    }

}

extension BaseTableViewController {
    private func loading(_ load: Bool) {
        if load {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.addSubview(loadingView)
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            loadingView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
            loadingView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
            loadingView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
            loadingView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        } else {
            loadingView.removeFromSuperview()
        }
    }
}
