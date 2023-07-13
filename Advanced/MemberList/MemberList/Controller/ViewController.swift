//
//  ViewController.swift
//  MemberList
//
//  Created by Kaala on 2023/05/30.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var memberListManager:MemberListManager = MemberListManager()

    
    // navBar plus button
    lazy var plusButton:UIBarButtonItem = {
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return btn
    }()
    
    override func viewDidLoad() {
        print("VC")
        print(#function)
        super.viewDidLoad()
        
        setTableView()
        setupTableViewConstraints()
        setupNavigationBar()
        setupUI()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupData(){
        memberListManager.requestMemberData()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
        
    }
    
    
    //MARK: - AutoLayout Setting
    private func setupTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNavigationBar(){
        title = "회원 목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.tintColor = .blue
        
        // right side of navBar setting
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    
    @objc private func plusButtonTapped(){
        let detailVC = DetailViewController()
        show(detailVC, sender: nil)
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell") as! MyTableViewCell
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.member = memberListManager[indexPath.row]
        
        show(detailVC, sender: self)
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}

