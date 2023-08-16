//
//  HomeViewController.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit
import SnapKit

final class HomeViewController: ViewController {
    
    private(set) lazy var searchController = UISearchController().then {
        $0.obscuresBackgroundDuringPresentation = false
        $0.hidesNavigationBarDuringPresentation = false
        $0.searchBar.placeholder = "Search"
        $0.searchBar.delegate = self
    }
    private(set) lazy var tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.register(cell: GameItemTableViewCell.self)
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
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
        viewModel.getGamesList()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func observeClosures() {
        viewModel.refreshData = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.onError = { [weak self] _ in
            self?.showErrorAlert(message: "Terjadi Kesalahan, Silahkan Coba Lagi")
        }
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("home tapped")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gamesList.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cell: GameItemTableViewCell.self)
        let cellModel = viewModel.gamesList.games[indexPath.row]
        
        cell.selectionStyle = .none
        cell.updateUI(
            imageUrl: cellModel.backgroundImage,
            title: cellModel.name,
            releaseDate: cellModel.released,
            rating: String(cellModel.rating))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
