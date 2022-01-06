//
//  UFBaseUIView.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import UIKit

class UFBaseUIView: UIView {
    init(with theme: UFTheme) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        #warning("Add logging")
        fatalError("init(coder:) has not been implemented")
    }
}

extension UFBaseUIView: ThemedView {
    var backgroundViewColor: UnsplashFeedColors {
        UnsplashFeedAsset.white
    }
    
    var textColor: UnsplashFeedColors {
        UnsplashFeedAsset.black
    }
}
