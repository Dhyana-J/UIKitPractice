//
//  DetailViewController.swift
//  TableViewWithCode
//
//  Created by Kaala on 2023/05/27.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var movieData:Movie? // 이전 화면에서 넘어오는 영화데이터
    
    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        guard let m = movieData else {
            print("data do not exist")
            detailView.mainImageView.image = UIImage(systemName: "person.crop.circle")
            detailView.movieNameLabel.text = "Data do not exist"
            detailView.descriptionLabel.text = "Data do not exist"
            return
        }
        detailView.mainImageView.image = m.movieImage
        detailView.movieNameLabel.text = m.movieName
        detailView.descriptionLabel.text = m.movieDescription
    }
    

}
