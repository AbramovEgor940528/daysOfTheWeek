//
//  TableViewCell.swift
//  daysOfTheWeek
//
//  Created by Егор Абрамов on 07.07.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    // MARK: - Private Nested Types
    private struct Constraints {
        struct RoundBackgroundView {
            static let horizontalSpacing: CGFloat = 16
            static let verticalSpacing: CGFloat = 8
        }
        
        struct DayLabel {
            static let horizontalSpacing: CGFloat = 20
        }
        
        struct DateLabel {
            static let horizontalSpacing: CGFloat = 16
        }
    }
    
    // MARK: - Private UI Properties
    private var roundBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Internal methods
    
    // Метод для установки значений ячейки
    func configCell(dayName: String, dateName: String) {
        dayLabel.text = dayName
        dateLabel.text = dateName
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupLabel() {
        addSubview(roundBackgroundView)
        addSubview(dayLabel)
        addSubview(dateLabel)
        
        roundBackgroundView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: Constraints.RoundBackgroundView.horizontalSpacing
        ).isActive = true
        roundBackgroundView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: -Constraints.RoundBackgroundView.horizontalSpacing
        ).isActive = true
        roundBackgroundView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: Constraints.RoundBackgroundView.verticalSpacing
        ).isActive = true
        roundBackgroundView.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -Constraints.RoundBackgroundView.verticalSpacing
        ).isActive = true
        
        dateLabel.trailingAnchor.constraint(
            equalTo: roundBackgroundView.trailingAnchor,
            constant: -Constraints.DateLabel.horizontalSpacing
        ).isActive = true
        dateLabel.centerYAnchor.constraint(
            equalTo: roundBackgroundView.centerYAnchor
        ).isActive = true
        dateLabel.setContentHuggingPriority(
            .defaultHigh,
            for: .horizontal
        )
        
        dayLabel.leadingAnchor.constraint(
            equalTo: roundBackgroundView.leadingAnchor,
            constant: Constraints.DayLabel.horizontalSpacing
        ).isActive = true
        dayLabel.trailingAnchor.constraint(
            equalTo: dateLabel.leadingAnchor,
            constant: Constraints.DayLabel.horizontalSpacing
        ).isActive = true
        dayLabel.centerYAnchor.constraint(
            equalTo: roundBackgroundView.centerYAnchor
        ).isActive = true
    }
}
