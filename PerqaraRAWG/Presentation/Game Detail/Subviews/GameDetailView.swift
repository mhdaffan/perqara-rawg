//
//  GameDetailView.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit
import SnapKit

final class GameDetailView: UIView {
    
    let imageView = UIImageView()
    let publisherLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    let releaseLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    let starImageView = UIImageView(image: .icStar)
    let ratingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    let joystickImageView = UIImageView(image: .icJoystick)
    let totalPlayLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    let descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubviews(
            imageView, publisherLabel, titleLabel, releaseLabel, starImageView,
            ratingLabel, joystickImageView, totalPlayLabel, descriptionLabel)
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(getSizeRatio(targetWidth: UIScreen.main.bounds.width, width: 1920, height: 1080).height)
        }
        publisherLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(publisherLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(publisherLabel)
        }
        releaseLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(publisherLabel)
        }
        starImageView.snp.makeConstraints {
            $0.top.equalTo(releaseLabel.snp.bottom).offset(4)
            $0.leading.equalTo(publisherLabel)
            $0.height.width.equalTo(16)
        }
        ratingLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(starImageView.snp.trailing).offset(4)
        }
        joystickImageView.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(ratingLabel.snp.trailing).offset(8)
            $0.width.equalTo(20)
            $0.height.equalTo(16)
        }
        totalPlayLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(joystickImageView.snp.trailing).offset(4)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(starImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(publisherLabel)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
    func updateUI(game: GameDetailModel) {
        imageView.setImageURL(urlString: game.backgroundImage, placeholder: "")
        publisherLabel.text = game.publisherString
        titleLabel.text = game.name
        releaseLabel.text = "Released date " + (game.released ?? "")
        ratingLabel.text = String(game.rating)
        totalPlayLabel.text = String(game.playtime) + " played"
        descriptionLabel.text = game.descriptionRaw
    }
    
}
