//
//  DetailViewController.swift
//  TableView
//
//  Created by Kaala on 2023/05/23.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescribtionLabel: UILabel!
    
    var movieData:Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        movieDescribtionLabel.text = movieData?.movieDescription
    }
    
    

}
