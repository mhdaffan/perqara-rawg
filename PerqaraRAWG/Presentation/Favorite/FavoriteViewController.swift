//
//  FavoriteViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit
import SnapKit

final class FavoriteViewController: ViewController {
    
    private let viewModel: FavoriteViewModel
    
    init(viewModel: FavoriteViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private(set) lazy var tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.register(cell: GameItemTableViewCell.self)
        $0.delegate = self
        $0.dataSource = self
    }
    let emptyLabel = UILabel().then {
        $0.text = "There are no favorite games"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 30)
        $0.numberOfLines = 0
        $0.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        observeClosures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
        viewModel.getFavoriteGames()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.addSubviews(tableView, emptyLabel)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        emptyLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func observeClosures() {
        viewModel.refreshData = { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        emptyLabel.isHidden = !viewModel.data.isEmpty
        tableView.isHidden = viewModel.data.isEmpty
        tableView.reloadData()
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GameDetailScreen.build(id: viewModel.data[indexPath.row].id)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cell: GameItemTableViewCell.self)
        let cellModel = viewModel.data[indexPath.row]
        
        cell.selectionStyle = .none
        cell.updateUI(
            imageUrl: cellModel.backgroundImage,
            title: cellModel.name,
            releaseDate: cellModel.released ?? String(),
            rating: String(cellModel.rating))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
