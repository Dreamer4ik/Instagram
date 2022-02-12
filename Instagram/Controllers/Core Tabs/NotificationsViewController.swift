//
//  NotificationsViewController.swift
//  Instagram
//
//  Created by Ivan Potapenko on 21.01.2022.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .grouped)
        table.isHidden = false
        table.register(NotificationLikeEventTableViewCell.self,
                       forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        
        table.register(NotificationFollowEventTableViewCell.self,
                       forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        return table
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        addSubviews()
//        spinner.startAnimating()
    }
    
    // MARK: Lifecycle
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(spinner)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func layoutNoNotificationsView() {
        tableView.isHidden = true
        view.addSubview(noNotificationsView)
        noNotificationsView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width/2,
            height: view.width/4
        )
        noNotificationsView.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
}
