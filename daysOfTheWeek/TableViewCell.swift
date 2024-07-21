//
//  TableViewCell.swift
//  daysOfTheWeek
//
//  Created by Егор Абрамов on 07.07.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var roundBackgroundView: UIView = UIView()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private struct ConstraintsRoundBackgroundView {
        static let roundBackgroundViewLeading: CGFloat = 16
        static let roundBackgroundViewTrailing: CGFloat = -16
        static let roundBackgroundViewTop: CGFloat = 8
        static let roundBackgroundViewBottom: CGFloat = -8
    }
    
    private struct ConstraintsDayLabel {
        static let dayLabelLeading: CGFloat = 20
        static let dayLabelTrailing: CGFloat = -20
    }
    
    private struct ConstraintsDateLable {
        static let dateLabelTrailing: CGFloat = -17
    }
    
    private func setapLabel() {
        addSubview(roundBackgroundView)
        addSubview(dayLabel)
        addSubview(dateLabel)
        
        roundBackgroundView.backgroundColor = .black
        roundBackgroundView.layer.cornerRadius = 20
        roundBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        roundBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstraintsRoundBackgroundView.roundBackgroundViewLeading).isActive = true
        roundBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ConstraintsRoundBackgroundView.roundBackgroundViewTrailing).isActive = true
        roundBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: ConstraintsRoundBackgroundView.roundBackgroundViewTop).isActive = true
        roundBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ConstraintsRoundBackgroundView.roundBackgroundViewBottom).isActive = true
        
        dateLabel.trailingAnchor.constraint(equalTo: roundBackgroundView.trailingAnchor, constant: ConstraintsDateLable.dateLabelTrailing).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: roundBackgroundView.centerYAnchor).isActive = true
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        dayLabel.leadingAnchor.constraint(equalTo: roundBackgroundView.leadingAnchor, constant: ConstraintsDayLabel.dayLabelLeading).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: ConstraintsDayLabel.dayLabelTrailing).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: roundBackgroundView.centerYAnchor).isActive = true
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setapLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
