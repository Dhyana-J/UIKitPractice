//
//  MyTableViewCell.swift
//  TableViewWithCode
//
//  Created by Kaala on 2023/05/26.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    
    let mainImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let movieNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let movieDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView:UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupStackView(){
        //cell에 기본적으로 contentView가 내장되어있음 거기에 내용들을 추가해주자
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(movieDescriptionLabel)
//        stackView.addSubview(movieNameLabel)
//        stackView.addSubview(movieDescriptionLabel) // description이 안나옴
    }
    
    
    func setConstraints(){
        setMainImageViewConstraints()
        setMovieNameLabelConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints(){
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setMovieNameLabelConstraints(){
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor,constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
    
}
