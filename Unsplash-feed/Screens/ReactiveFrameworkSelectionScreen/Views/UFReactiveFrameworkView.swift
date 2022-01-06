//
//  UFReactiveFrameworkView.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import SnapKit
import UIKit

final class UFReactiveFrameworkView: UIView {
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    
    init(logo: UnsplashFeedImages.Image, title: String) {
        super.init(frame: .zero)
        configure(logo, title)
    }
    
    private func configure(_ logo: UIImage, _ text: String) {
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        
        layoutLogo(logo)
        layoutTitle(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UFReactiveFrameworkView {
    private func layoutLogo(_ logo: UIImage) {
        addSubview(logoImageView)
        logoImageView.image = logo
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(13)
            make.leading.equalToSuperview().inset(25)
            make.width.height.equalTo(35)
        }
    }
    
    private func layoutTitle(_ title: String) {
        addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.font = UnsplashFeedFontFamily.Roboto.regular.font(size: 18)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
