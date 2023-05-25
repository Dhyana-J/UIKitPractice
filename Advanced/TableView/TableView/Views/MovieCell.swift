//
//  MovieCell.swift
//  TableView
//
//  Created by Kaala on 2023/05/16.
//

import UIKit

// Cell은 재사용된다.
// 스크롤을 할 때 화면상에 나타나는 데이터에 대한 모든 Cell이 Heap에 올라가면 메모리 낭비가 심해질 수 있으므로 재사용된다
class MovieCell: UITableViewCell {

    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
