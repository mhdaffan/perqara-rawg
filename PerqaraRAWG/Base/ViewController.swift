//
//  ViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 15/08/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var refreshControl = UIRefreshControl().then {
        $0.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        $0.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addRightBarButtonItem(image: UIImage?, tintColor: UIColor? = nil, action: Selector) {
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: 24, height: 24)
        button.setImage(image, for: .normal)
        if let tintColor = tintColor {
            button.tintColor = tintColor
        }
        button.addTarget(self, action: action, for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        item.customView?.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func removeRightBarButtonItem() {
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc func refresh() {}
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    func beginRefreshing() {
        refreshControl.beginRefreshing()
    }
    
    func pullToRefresh(isRefreshing: Bool) {
        if isRefreshing {
            beginRefreshing()
        } else {
            endRefreshing()
        }
    }
    
}
