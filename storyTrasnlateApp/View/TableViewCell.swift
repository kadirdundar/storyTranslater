//
//  TableViewCell.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var containerWv : UIView = {
            let vw = UIView()
            vw.translatesAutoresizingMaskIntoConstraints = false
            return vw
        }()
        
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerWv)
        containerWv.addSubview(titleLabel)
        containerWv.addSubview(infoLabel)
        
        contentView.backgroundColor = .white
        containerWv.layer.cornerRadius = 10
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerWv.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerWv.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerWv.trailingAnchor, constant: -16),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: containerWv.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: containerWv.trailingAnchor, constant: -16),
            infoLabel.bottomAnchor.constraint(equalTo: containerWv.bottomAnchor, constant: -8),
            
            containerWv.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerWv.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerWv.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14),
            containerWv.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -14),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, info: String,number : Int) {
        titleLabel.text = title
        infoLabel.text = info
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen,.systemGray] // renk seçenekleri
        var num = number % 4
        let randomColor = colors[num]
        containerWv.backgroundColor = randomColor
        
    }
}
