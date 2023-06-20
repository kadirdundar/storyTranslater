//
//  TableViewCell.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit
protocol CustomTableViewCellDelegate: AnyObject {
    func didSelectItem(_ cell: CustomTableViewCell, indexPath: IndexPath)
}

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    weak var delegate: CustomTableViewCellDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Bölüm dolgusunu sıfıra ayarla
        layout.minimumLineSpacing = 10 // Bu satırı ekledik
        layout.minimumInteritemSpacing = 0 // Bu satırı ekledik
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // İçerik dolgusunu sıfıra ayarla
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = backgroundColor
        return cv
    }()

    
    private lazy var title :UILabel = {
        let title = UILabel()
        title.text = "Başlık"
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.textColor = .color5
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    private lazy var containerWv : UIView = {
               let vw = UIView()
               vw.translatesAutoresizingMaskIntoConstraints = false
               return vw
           }()
    
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    
    func setupUI(){
        contentView.addSubview(containerWv)
        containerWv.addSubview(title)
        contentView.addSubview(collectionView)
                               
        contentView.backgroundColor = .systemBackground
        containerWv.layer.cornerRadius = 10
        containerWv.backgroundColor = .color3
        
        

        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: containerWv.leadingAnchor, constant: 5),
            title.topAnchor.constraint(equalTo: containerWv.topAnchor, constant: 25),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            collectionView.bottomAnchor.constraint(equalTo: containerWv.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: containerWv.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: containerWv.trailingAnchor),
            
            containerWv.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerWv.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerWv.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            containerWv.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: 0),
                
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: "Hikaye \(indexPath.item + 1)")
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            delegate?.didSelectItem(self, indexPath: indexPath)
        }
}
