//
//  GameItemTableViewCell.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit
import SnapKit

final class GameItemTableViewCell: UITableViewCell {
    
    let iconImageView = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    let releaseLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 12)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    let starImageView = UIImageView(image: .icStar)
    let ratingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubviews(iconImageView, titleLabel, releaseLabel, starImageView, ratingLabel)
        iconImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(85)
            $0.width.equalTo(150)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView).inset(2)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        releaseLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
        }
        starImageView.snp.makeConstraints {
            $0.top.equalTo(releaseLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
            $0.height.width.equalTo(16)
        }
        ratingLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(starImageView.snp.trailing).offset(4)
        }
    }
    
    func updateUI(imageUrl: String, title: String, releaseDate: String, rating: String) {
        iconImageView.setImageURL(urlString: imageUrl)
        titleLabel.text = title
        releaseLabel.text = "Released date " + releaseDate
        ratingLabel.text = rating
    }
    
}
