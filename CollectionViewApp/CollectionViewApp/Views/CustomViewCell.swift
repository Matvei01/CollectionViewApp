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
    
    // MARK: - Static Properties
    static var reuseID: String = "personCell"
    
    // MARK: - Private Properties
    private var viewWidth: CGFloat = 0
    
    // MARK: - UI Elements
    private lazy var mainView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .appBackGroundView
        return cellView
    }()
    
    private lazy var profileImageView: UIImageView = {
        createImageView(radius: 22)
    }()
    
    private lazy var largeImageView: UIImageView = {
        createImageView()
    }()
    
    private lazy var nameLabel: UILabel = {
        createLabel(font: .systemFont(ofSize: 20, weight: .black))
    }()
    
    private lazy var dateLabel: UILabel = {
        createLabel(font: .systemFont(ofSize: 14, weight: .regular), textColor: .appGray)
    }()
    
    private lazy var headerLabel: UILabel = {
        createLabel(font: .systemFont(ofSize: 22, weight: .bold))
    }()
    
    private lazy var descriptionLabel: UILabel = {
        createLabel(font: .systemFont(ofSize: 16, weight: .regular))
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewWidth = UIScreen.main.bounds.width
        
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with person: Person) {
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
        addSubview(mainView)
        for subview in [profileImageView,
                        nameLabel,
                        largeImageView,
                        dateLabel,
                        headerLabel,
                        descriptionLabel] {
            
            mainView.addSubview(subview)
        }
    }
    
    func createImageView(radius: CGFloat? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = radius ?? 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func createLabel(font: UIFont, textColor: UIColor? = nil) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

// MARK: - Constraints
private extension CustomViewCell {
    func setConstraints() {
        setConstraintsForMainView()
        setConstraintsForProfileImageView()
        setConstraintsForNameLabel()
        setConstraintsFor(largeImageView, topView: nameLabel, topAnchorConstant: 30)
        setConstraintsFor(dateLabel, topView: largeImageView, topAnchorConstant: 9)
        setConstraintsFor(headerLabel, topView: dateLabel, topAnchorConstant: 4)
        setConstraintsForDescriptionLabel()
    }
    
    func setConstraintsForMainView() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            mainView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            mainView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            mainView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            mainView.widthAnchor.constraint(
                equalToConstant: viewWidth - 60
            )
        ])
    }
    
    func setConstraintsForProfileImageView() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(
                equalTo: mainView.topAnchor,
                constant: 20
            ),
            profileImageView.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor,
                constant: 20
            ),
            profileImageView.widthAnchor.constraint(
                equalToConstant: 44
            ),
            profileImageView.heightAnchor.constraint(
                equalToConstant: 44
            )
        ])
    }
    
    func setConstraintsForNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(
                equalTo: mainView.topAnchor,
                constant: 30
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: 20
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor,
                constant: -20
            )
        ])
    }
    
    func setConstraintsForDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: headerLabel.bottomAnchor,
                constant: 10
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor,
                constant: 20
                
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor,
                constant: -20
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: mainView.bottomAnchor,
                constant: -20
            )
        ])
    }
    
    func setConstraintsFor(_ bottomView: UIView, topView: UIView, topAnchorConstant: CGFloat) {
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(
                equalTo: topView.bottomAnchor,
                constant: topAnchorConstant
            ),
            
            bottomView.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor,
                constant: 20
            ),
            bottomView.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor,
                constant: -20
            )
        ])
    }
}
