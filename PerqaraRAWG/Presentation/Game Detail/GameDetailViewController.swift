//
//  GameDetailViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit
import SnapKit

final class GameDetailViewController: ViewController {
    
    private let viewModel: GameDetailViewModel
    
    init(viewModel: GameDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        title = "Detail"
    }
    
}
