//
//  GameDetailViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit
import SnapKit

final class GameDetailViewController: ViewController {
    
    private(set) lazy var scrollView = UIScrollView().then {
        $0.refreshControl = self.refreshControl
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let contentView = GameDetailView().then {
        $0.backgroundColor = .white
        $0.isHidden = true
    }
    
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
        observeClosures()
        fetchGameDetail()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addRightBarButtonItem(image: .icLoveOutlined, tintColor: .black, action: #selector(tapFavoriteButton))
    }
    
    override func refresh() {
        viewModel.fetchGameDetail()
    }
    
    private func configureUI() {
        title = "Detail"
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.view)
        }
    }
    
    private func observeClosures() {
        viewModel.refreshData = { [weak self] in
            self?.endRefreshing()
            if let game = self?.viewModel.gameDetail {
                self?.contentView.updateUI(game: game)
                self?.contentView.isHidden = false
            }
        }
        
        viewModel.onError = { [weak self] _ in
            self?.endRefreshing()
            self?.showErrorAlert(message: "Terjadi Kesalahan, Silahkan Coba Lagi")
        }
    }
    
    func fetchGameDetail() {
        beginRefreshing()
        viewModel.fetchGameDetail()
    }
    
    @objc func tapFavoriteButton() {
        removeRightBarButtonItem()
        addRightBarButtonItem(image: .icLove, tintColor: .black, action: #selector(tapFavoriteButton))
    }
    
}
