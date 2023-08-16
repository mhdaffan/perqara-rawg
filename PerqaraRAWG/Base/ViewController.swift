//
//  ViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 15/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}
