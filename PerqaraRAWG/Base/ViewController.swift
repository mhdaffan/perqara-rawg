//
//  ViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 15/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var refreshControl = UIRefreshControl().then {
        $0.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        $0.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func refresh() {}
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    func beginRefreshing() {
        refreshControl.beginRefreshing()
    }

}
