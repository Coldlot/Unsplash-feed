//
//  UFReactiveFrameworkSelectionViewController.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 24.11.2021.
//

import SnapKit
import UIKit

final class UFReactiveFrameworkSelectionViewController: UFBaseUIViewController<UFReactiveFrameworkSelectionViewModel> {
    private let logoImageView = UIImageView()
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let rxButton = UFReactiveFrameworkView(logo: UnsplashFeedAsset.rxLogo.image, title: "RxSwift")
    private let combineButton = UFReactiveFrameworkView(logo: UnsplashFeedAsset.appleLogo.image, title: "Apple Combine")
    private let dataSourcePicker = UFDataSourcePickerView(leftTitle: "Remote", rightTitle: "Local Mocks")
    private let versionLabel = UILabel()
    
    override func bind() {
        super.bind()
    }
    
    override func appearence() {
        super.appearence()
        
        logoImageView.image = UnsplashFeedAsset.unsplashFullLogo.image
        logoImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.image = UnsplashFeedAsset.mountaints.image
        backgroundImageView.contentMode = .scaleToFill
        
        titleLabel.text = "PickReactiveFrameworkTitle".localized()
        titleLabel.font = UnsplashFeedFontFamily.Roboto.regular.font(size: 24)
        titleLabel.textColor = .white//textColor.color
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
                
        versionLabel.text = viewModel.version
        versionLabel.font = UnsplashFeedFontFamily.Roboto.regular.font(size: 14)
        versionLabel.textColor = textColor.color
    }
    
    override func configureViews() {
        super.configureViews()
        
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(57)
        }
        
        view.addSubview(versionLabel)
        versionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(15)
        }
        versionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            #warning("Fix spacing")
            make.bottom.equalTo(versionLabel.snp.top)
        }

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.top).inset(45)
            make.leading.trailing.equalToSuperview().inset(22)
        }
        
        view.addSubview(rxButton)
        rxButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(62)
        }
        
        view.addSubview(combineButton)
        combineButton.snp.makeConstraints { make in
            make.top.equalTo(rxButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(62)
        }
        
        view.addSubview(dataSourcePicker)
        dataSourcePicker.snp.makeConstraints { make in
            make.top.equalTo(combineButton.snp.bottom).offset(160)
            make.leading.trailing.equalToSuperview().inset(45)
            make.centerX.equalToSuperview()
        }
    }
}
