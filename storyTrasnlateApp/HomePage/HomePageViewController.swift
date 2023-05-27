//
//  HomePageViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit


class HomePageViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    private let data: [(title: String, info: String)] = [
        ("Başlık 1", "Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 1Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2"),
        ("Başlık 2", "Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2"),
        ("Başlık 3", "Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 3Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2"),
        ("Başlık 2", "Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2"),
        ("Başlık 2", "Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2Bilgi satırı 2"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        setupTableView()
        
      
    }
    func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        title = "Home Page"
    }
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
}
extension HomePageViewController:  UITableViewDataSource, UITableViewDelegate {
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let item = data[indexPath.row]
        cell.configure(title: item.title, info: item.info,number: indexPath.row)
        return cell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ViewController() // Geçiş yapmak istediğiniz ViewController'ın instance'ını oluşturun
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
}
