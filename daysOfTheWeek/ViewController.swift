//
//  ViewController.swift
//  daysOfTheWeek
//
//  Created by Егор Абрамов on 30.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    let daysOfWeek: [String] = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    let dates: [String] = ["01.07", "02.07", "03.07", "04.07", "05.07", "06.07", "07.07"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        
    }
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {134}
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            cell.dayLabel.text = daysOfWeek[indexPath.row]
            cell.dateLabel.text = dates[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
}
