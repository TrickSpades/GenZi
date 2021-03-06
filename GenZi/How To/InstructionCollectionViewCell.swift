//
//  InstructionCollectionViewCell.swift
//  GenZi
//
//  Created by Adar Butel on 9/9/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

let boldFontSize = 18 as CGFloat
let thinFontSize = 14 as CGFloat

class InstructionCollectionViewCell: UICollectionViewCell, UITextViewDelegate {
    
    // Possible Cell Border Colors to Select From
    private let borderColors = [UIColor(red: 102/255, green: 96/255, blue: 176/255, alpha: 1.0)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        //imageView.backgroundColor = UIColor.redColor()
        imageView.layer.cornerRadius = cornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews() {
        backgroundColor = UIColor.black
        // Set Layer Properties
        layer.borderWidth = 2
        layer.borderColor = borderColors[Int.randomIntFrom(start: 0, to: borderColors.count - 1)].cgColor
        layer.cornerRadius = 10
        
        addSubview(titleLabel)
        addSubview(descriptionTextView)
        addSubview(imageView)

        // Layout Constraints with Visual Format
        
        // Set Constant Image Size
        addConstraints(withFormat: "[v0(==175)]", views: imageView)
        
        // Set Title Distance from Image
        addConstraints(withFormat: "H:|[v0]-15-[v1]-15-|", views: imageView, titleLabel)
        
        // Set Description Distance from Image
        addConstraints(withFormat: "H:|[v0]-10-[v1]-10-|", views: imageView, descriptionTextView)
        
        // Set Image Vertical Size to Touch Top and Bottom
        addConstraints(withFormat: "V:|[v0]|", views: imageView)
        
        // Set Vertical distance from Title to Description
        addConstraints(withFormat: "V:|-10-[v0][v1]-10-|", views: titleLabel, descriptionTextView)
    }
}
