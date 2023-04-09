//
//  DetailView.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 9.04.2023.
//

import UIKit
class detailView: UIView {
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let firstText : UITextView = {
        let firstText = UITextView()
        firstText.translatesAutoresizingMaskIntoConstraints = false
        firstText.textColor = .white
        firstText.text = "askjdnljasnfsanflanfljanfanfalsfnlsfnljfnljasfnljanflsakmfdşaksnfşansfafkkfknaşfnkafsşanfşka"
        
        return firstText
    }()
    private let secondText : UITextView = {
        let secondText = UITextView()
        secondText.translatesAutoresizingMaskIntoConstraints = false
        secondText.textColor = .white
        secondText.text = "askjdnljasnfsanflanfljanfanfalsfnlsfnljfnljasfnljanflsakmfdşaksnfşansfafkkfknaşfnkafsşanfşka"
        
        return secondText
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(stackView)
        stackView.backgroundColor = .systemBlue
        stackView.addArrangedSubview(firstText)
        stackView.addArrangedSubview(secondText)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                    stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
