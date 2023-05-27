//
//  DetailViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 9.04.2023.
//
import UIKit
import CoreData

class ViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate{
    
    private let viewModel = DetailViewModel()
    private let vieww = DetailView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vieww.textView.delegate = self
        setupUI()
        vieww.textView.isSelectable = true

        
        
    }
    
    fileprivate func setupUI() {
        view.addSubview(vieww)
        vieww.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        title = "Hikaye İsmi"
        
        
        NSLayoutConstraint.activate([
            vieww.textView.topAnchor.constraint(equalTo: view.topAnchor),
            vieww.textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vieww.textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vieww.textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    func textViewDidChangeSelection(_ textView: UITextView) {
        if let selectedRange = vieww.textView.selectedTextRange {
            let selectedText = vieww.textView.text(in: selectedRange)
            if let word = selectedText?.trimmingCharacters(in: .whitespacesAndNewlines) {
                let alertController = viewModel.showAlert(for: word)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}

