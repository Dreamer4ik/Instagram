//
//  ListViewController.swift
//  Instagram
//
//  Created by Ivan Potapenko on 21.01.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    private let data: [UserRelationship]
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UserFollowTableViewCell.self,
                       forCellReuseIdentifier: UserFollowTableViewCell.identifier)
        return table
    }()
    
    
    // MARK: - Init
    init(data: [UserRelationship]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .systemBackground
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier,
                                                 for: indexPath) as! UserFollowTableViewCell
        
        cell.configure(model: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Go to profile of selected cell
        let model = data[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension ListViewController: UserFollowTableViewCellDelegate {
    func didTapFollowUnfollowButton(model: UserRelationship) {
        switch model.type {
        case .following:
            // perform firebase update to unffollow
            break
        case .not_following:
            // perform firebase update to ffollow
            break
        }
    }
    
    
}
