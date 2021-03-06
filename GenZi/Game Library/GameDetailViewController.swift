//
//  GameDetailViewController.swift
//  GenZi
//
//  Created by Adar Butel on 9/10/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    //var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

//        titleLabel.text = game.title
//        descriptionTextView.text = game.description
//        imageView.image = game.image
        
        titleLabel.text = "Raw Data"
        descriptionTextView.text = "Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, Crazy game forreal, "
        //imageView.image = nil
        
        setupViews()
    }

    // Title Label
    let titleLabel: UILabel = {
        let label = UILabel()
        // Unlimited Amount of Lines
        label.numberOfLines = 0
        // Set to system bold font size
        label.font = UIFont.boldSystemFont(ofSize: boldFontSize)
        label.textColor = UIColor.white
        // Wrap at the end of lines
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Desription Text View
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        // Set to system thin font size
        textView.font = UIFont.systemFont(ofSize: thinFontSize)
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.white
        // Remove ability to select and edit the text view
        textView.isEditable = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Example Image View
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews() {
        
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionTextView)
        
        // Layout Constraints with Visual Format
        
        // Set ImageView Size to Frame Height / 3
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: view.frame.size.height / 3))
        
        // Center the label in the view
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Center Description in the view
        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Set Title Horizontal Constraints
        // view.addConstraints(withFormat: "H:|-45-[v0]-45-|", views: titleLabel)
        
        // Set Image Horizontal Constraints
        view.addConstraints(withFormat: "H:|[v0]|", views: imageView)
        
        // Set Description View Horizontal Constraints
        view.addConstraints(withFormat: "H:|-5-[v0]-5-|", views: descriptionTextView)
        
        // Set Vertical Layout
        view.addConstraints(withFormat: "V:|[v0]-20-[v1]-10-[v2]|", views: imageView, titleLabel, descriptionTextView)
    }

}
