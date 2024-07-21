//
//  ViewController.swift
//  daysOfTheWeek
//
//  Created by Егор Абрамов on 30.06.2024.
//

import UIKit

class ViewController: UIViewController {
    private struct DataSource {
        let day: String
        let data: String
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    private let dataSource: [DataSource] = [
        DataSource(day: "Понедельник", data: "01.07"),
        DataSource(day: "Вторник", data: "02.07"),
        DataSource(day: "Среда", data: "03.07"),
        DataSource(day: "Четверг", data: "04.07"),
        DataSource(day: "Пятница", data: "05.07"),
        DataSource(day: "Суббота", data: "06.07"),
        DataSource(day: "Воскресенье", data: "07.07"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
    }
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor
        ).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor
        ).isActive = true
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
    }
}
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 134 }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
        }
    


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
//            cell.dayLabel.text = daysOfWeek[indexPath.row]
//            cell.dateLabel.text = dates[indexPath.row]
//            
//            return cell
//        }
//        
//        return UITableViewCell()
//        
//        if создание ячейки {
//            настройка ячейки
//            return ячейка
//        }
//        return базовая ячейка
//        
//        guard создание ячейки else {return базовая ячейка}
//        настройка ячейки
//        return ячейка
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.configCell(
            dayName: dataSource[indexPath.row].day,
            dateName: dataSource[indexPath.row].data
        )
        
        return cell
    }
}
