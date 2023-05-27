//
//  ViewController.swift
//  TableViewWithCode
//
//  Created by Kaala on 2023/05/25.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    var movieDataManager = DataManager()
    var movieArray:[Movie] = []

    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        setupData()
        setupTableView()
        setupUI()
    }
    
    func setupData(){
        movieArray = movieDataManager.getMovieData()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        setupNaviBar()
        setupTableViewConstraints()
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        
        // 셀 사용등록 (스토리보드로 하면 자동으로 등록된다)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setupNaviBar(){
        title = "영화 목록"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    
    
    


}


extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
        
        let movieData = movieArray[indexPath.row]
        
        cell.mainImageView.image = movieData.movieImage
        cell.movieNameLabel.text = movieData.movieName
        cell.movieDescriptionLabel.text = movieData.movieDescription
        
        return cell
    }
    
    
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.cellForRow(at: indexPath)!
//        cell.selectionStyle = .gray
        
        let detailVC = DetailViewController()
        detailVC.movieData = movieArray[indexPath.row]
//        present(detailVC, animated: true)
        show(detailVC,sender: nil) // show가 pushViewController를 포함하는 개념, 아이패드에서는 바로 옆에, 아이폰에서는 다음 화면으로 넘어가짐 ( UISplitViewController 사용 여부 차이)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}

