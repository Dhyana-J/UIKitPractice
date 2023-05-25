//
//  ViewController.swift
//  TableView
//
//  Created by Kaala on 2023/05/16.
//

import UIKit

final class ViewController: UIViewController {
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        tableView.rowHeight = 120
        setDelegate()
        setUI()
    }
    
    private func setDelegate(){
        tableView.dataSource = self // tableView의 컨텐츠를 표시하는 대리자는 이름이 dataSource
        tableView.delegate = self
    }
    
    private func setUI(){
        title = "영화 목록"
    }
    
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let addResult = movieDataManager.addMovieData()
        if addResult {
            self.tableView.reloadData()
        } else {
            print("failed to add data")
        }
    }
    
}


// UITableViewDataSource : 테이블뷰 구성 형태를 다루는 프로토콜
extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // How many cells?
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // How do organize cells?
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell // identifier는 StoryBoard에서 설정해놔야 한다
        
//        indexPath.section //행들의 그룹
//        indexPath.row //그룹별 행의 순서
        let movie = movieDataManager.getMovieData()[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.movieDescriptionLabel.text = movie.movieDescription
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}


// UITableViewDelegate : 테이블뷰 동작을 다루는 프로토콜
extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // 테이블 행 눌리면 실행
        print(#function)
        performSegue(withIdentifier: "toDetailVC", sender: indexPath) // sender에는 전달할 데이터 넣기
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = sender as! IndexPath
            let movieData = movieDataManager.getMovieData()
            detailVC.movieData = movieData[indexPath.row]
        }
    }
}


