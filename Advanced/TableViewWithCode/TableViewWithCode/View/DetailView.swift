//
//  DetailView.swift
//  TableViewWithCode
//
//  Created by Kaala on 2023/05/26.
//

import UIKit

final class DetailView: UIView {
    
    let mainImageView:UIImageView = UIImageView()
    
    let movieNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let descriptionLabel:UILabel = {
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
        sv.spacing = 15
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView(){
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        self.addSubview(stackView)
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints(){
        setMainImageViewConstraints()
        setMovieNameLabelConstraints()
        setDescriptionLabelConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints(){
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 240),
            mainImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func setMovieNameLabelConstraints(){
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setDescriptionLabelConstraints(){
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 100)
        ])
    }
    
    
}
