//
//  DetailView.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 9.04.2023.
//

import UIKit

class CustomTextView: UITextView {
    var sentenceIndex: Int?
}

/*import UIKit
class detailView: UIView {
    private let viewModel = detailViewModel()
    
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
        firstText.textColor = .black
        firstText.text = "askjdnljasnfsanflanflj anfanfalsfnlsfnljfnljasfnljanfls. akmfdşaksnfş ansfafkkfknaşfnkafsşanfşka .askjdnljasnfsanflanflj anfanfalsfnlsfnljfnljasfnljanfls. akmfdşaksnfş ansfafkkfknaşfnkafsşanfşka"
        firstText.font = .boldSystemFont(ofSize: 20)
        
        return firstText
    }()
    private let secondText : UITextView = {
        let secondText = UITextView()
        secondText.translatesAutoresizingMaskIntoConstraints = false
        secondText.textColor = .black
        secondText.text = "askjdnljasnfsanflanflj anfanfalsfnlsfnljfnl. jasfnljanflsakmfdşaksnfşansfafkk. fknaşfnkafsşanfşka askjdnljasnfsanflanflj anfanfalsfnlsfnljfnl .jasfnljanflsakmfdşaksnfşansfafk"
        secondText.font = .boldSystemFont(ofSize: 20)

        return secondText
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        viewModel.firstText = firstText
        viewModel.secondText = secondText
        
        let longPressGesture1 = UILongPressGestureRecognizer(target: viewModel, action: #selector(viewModel.textViewLongPressed(_:)))
        firstText.addGestureRecognizer(longPressGesture1)
        
        let longPressGesture2 = UILongPressGestureRecognizer(target: viewModel, action: #selector(viewModel.textViewLongPressed(_:)))
                secondText.addGestureRecognizer(longPressGesture2)
        
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
*/
