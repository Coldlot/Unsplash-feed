//
//  UFBaseUIViewController.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import UIKit

class UFBaseUIViewController<T: ViewModel>: UIViewController {
    private(set) var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        #warning("Add loggin here")
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        #warning("Add loggin here")
        print("\(id) - deinited")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor.color
        bind()
        appearence()
        configureViews()
    }
    
    func bind() {}
    func appearence() {}
    func configureViews() {}
}

extension UFBaseUIViewController: IndentifiableViewController {
    var id: String {
        self.description
    }
}

extension UFBaseUIViewController: ThemedViewController {
    var backgroundColor: UnsplashFeedColors {
        UnsplashFeedAsset.white
    }
    
    var textColor: UnsplashFeedColors {
        UnsplashFeedAsset.black
    }
}
