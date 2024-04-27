//
//  CustomViewCell.swift
//  CollectionViewApp
//
//  Created by Matvei Khlestov on 27.04.2024.
//

import UIKit

// MARK: - CellProtocol
protocol CellProtocol: AnyObject {
    static var reuseID: String { get }
}

// MARK: - CustomViewCell
final class CustomViewCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "personCell"
    
    private var viewWidth: CGFloat = 0
    
    // MARK: - UI Elements
    private lazy var cellView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .appBackGroundView
        return cellView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var largeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .appGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewWidth = UIScreen.main.bounds.width
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with person: Person) {
        setupView()
        
        profileImageView.image = UIImage(named: person.profileImage)
        largeImageView.image = UIImage(named: person.largeImage)
        
        nameLabel.text = person.name
        dateLabel.text = person.date
        headerLabel.text = "Ut enim ad minim veniam"
        descriptionLabel.text = person.description
    }
}

// MARK: - Private methods
private extension CustomViewCell {
    func setupView() {
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        addSubview(cellView)
        for subview in [profileImageView,
                        nameLabel,
                        largeImageView,
                        dateLabel,
                        headerLabel,
                        descriptionLabel] {
            
            cellView.addSubview(subview)
        }
    }
}

// MARK: - Constraints
private extension CustomViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellView.widthAnchor.constraint(equalToConstant: viewWidth - 60)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            profileImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            largeImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            largeImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            largeImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
        ])
        //optimization
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: largeImageView.bottomAnchor, constant: 9),
            dateLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20)
        ])
        //optimization
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            headerLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20)
        ])
    }
}
