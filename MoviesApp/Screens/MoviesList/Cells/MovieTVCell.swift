//
//  PhotosTVCell.swift
//  PhotosChallenge
//
//  Created by Front Tech on 18/05/2022.
//

import Foundation
import UIKit


class MovieTVCell: UITableViewCell {
    
    
    var movieImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 140).isActive = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var movieTitle: UILabel = {
        let mtl = UILabel()
        mtl.textColor = .black
        mtl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        mtl.numberOfLines = 2
        return mtl
    }()
    
    var movieOverview: UILabel = {
        let mrdl = UILabel()
        mrdl.textColor = .darkGray
        mrdl.numberOfLines = 3
        mrdl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        mrdl.textAlignment = .left
        return mrdl
    }()
    
    var movieReleaseDate: UILabel = {
        let mrdl = UILabel()
        mrdl.textColor = .systemGray
        mrdl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        mrdl.textAlignment = .left
        return mrdl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .white
    }
    
    private func configure(){
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            movieTitle , movieOverview , movieReleaseDate
        ])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        
        let stackView = UIStackView(arrangedSubviews: [
            movieImageView, labelsStackView
        ])
        stackView.spacing = 10
        stackView.alignment = .center
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5.0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0).isActive = true
    }
}
