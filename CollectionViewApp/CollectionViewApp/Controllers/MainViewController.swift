//
//  MainViewController.swift
//  CollectionViewApp
//
//  Created by Matvei Khlestov on 27.04.2024.
//

import UIKit

// MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - Private Properties
    let persons = Person.getPerson()
    
    // MARK: - UI Elements
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        let collectionView = UICollectionView(
            frame: view.frame,
            collectionViewLayout: layout
        )
        collectionView.register(CustomViewCell.self, forCellWithReuseIdentifier: CustomViewCell.reuseID)
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainCollectionView)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        persons.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomViewCell.reuseID,
            for: indexPath
        )
        guard let cell = cell as? CustomViewCell else {
            return UICollectionViewCell()
        }
        
        let person = persons[indexPath.item]
        
        cell.configure(with: person)
        return cell
    }
}

