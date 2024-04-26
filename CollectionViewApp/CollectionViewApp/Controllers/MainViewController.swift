//
//  MainViewController.swift
//  CollectionViewApp
//
//  Created by Matvei Khlestov on 27.04.2024.
//

import UIKit

// MARK: - MainViewController
final class MainViewController: UIViewController {

    // MARK: - UI Elements
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(
            frame: view.frame,
            collectionViewLayout: layout
        )
        
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

