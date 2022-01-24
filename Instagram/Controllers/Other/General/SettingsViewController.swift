//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Ivan Potapenko on 21.01.2022.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
    
}
/// View Controller to show user settings
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        configureModels()
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        //        tableView.frame = CGRect(
        //            x: <#T##CGFloat#>,
        //            y: <#T##CGFloat#>,
        //            width: <#T##CGFloat#>,
        //            height: <#T##CGFloat#>
        //        )
    }
    
    private func configureModels() {
        let section = [
            SettingCellModel(title: "Log Out") { [weak self]  in
                self?.didTapLogOut()
                
            }
            
        ]
        
        data.append(section)
    }
    
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure you want to log out?",
                                            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                            style: .destructive, handler: { _ in
            AuthManager.shared.LogOut { success in
                DispatchQueue.main.async {
                    if success {
                        // present Log In
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else {
                        // error occurred
                        fatalError("Could not log out user")
                    }
                }
                
            }
        }))
        //For Ipad
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        //
        present(actionSheet, animated: true, completion: nil)
       
    }
    
    
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if #available(iOS 14.0, *) {
            var config = cell.defaultContentConfiguration()
            config.text = data[indexPath.section][indexPath.row].title
            //            config.textProperties.numberOfLines = 0
            //            config.textProperties.font = .systemFont(ofSize: 25, weight: .bold)
            cell.contentConfiguration = config
            //            cell.selectionStyle = .none
            
        } else {
            cell.textLabel?.text = data[indexPath.section][indexPath.row].title
            //            cell.textLabel?.numberOfLines = 0
            //            cell.selectionStyle = .none
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Handle cell selection
        data[indexPath.section][indexPath.row].handler()
    }
    
}
