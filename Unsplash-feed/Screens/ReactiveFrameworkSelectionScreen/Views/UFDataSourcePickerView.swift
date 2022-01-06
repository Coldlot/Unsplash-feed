//
//  UFDataSourcePickerView.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import UIKit

class UFDataSourcePickerView: UIView {
    private let toggle = UISwitch()
    private let leftLabel = UILabel()
    private let rightLabel = UILabel()
    
    init(leftTitle: String, rightTitle: String) {
        super.init(frame: .zero)
        configure(leftText: leftTitle, rightText: rightTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(leftText: String, rightText: String) {
        layoutToggle()
        layoutLeftTitle(leftText)
        layoutRightTitle(rightText)
    }
}

extension UFDataSourcePickerView {
    private func layoutToggle() {
        addSubview(toggle)
        toggle.tintColor = .black
        toggle.layer.cornerRadius = toggle.frame.height / 2.0
        toggle.backgroundColor = .black
        toggle.layer.borderColor = UIColor.white.cgColor
        toggle.layer.borderWidth = 1
        toggle.clipsToBounds = true
        toggle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(51)
        }
    }
    
    private func layoutLeftTitle(_ text: String) {
        addSubview(leftLabel)
        leftLabel.text = text
        leftLabel.font = UnsplashFeedFontFamily.Roboto.regular.font(size: 14)
        leftLabel.textColor = .white
        leftLabel.textAlignment = .right
        leftLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(toggle)
            #warning("Fix spacing")
            make.trailing.equalTo(toggle.snp.leading)//.offset(26)
        }
    }
    
    private func layoutRightTitle(_ text: String) {
        addSubview(rightLabel)
        rightLabel.text = text
        rightLabel.font = UnsplashFeedFontFamily.Roboto.regular.font(size: 14)
        rightLabel.textColor = .white
        rightLabel.snp.makeConstraints { make in
            make.leading.equalTo(toggle.snp.trailing).offset(26)
            make.centerY.equalTo(toggle)
            make.trailing.equalToSuperview()
        }
    }
}
