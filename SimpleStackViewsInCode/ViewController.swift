//
//  ViewController.swift
//  SimpleStackViewsInCode
//
//  Created by Craig Grummitt on 25/06/2016.
//  Copyright © 2016 Craig Grummitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel(frame: CGRect.null)
        titleLabel.text = "Title"
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    lazy var subtitleLabel:UILabel = {
        let subtitleLabel = UILabel(frame: CGRect.null)
        subtitleLabel.text = "Subtitle goes here"
        subtitleLabel.textAlignment = .center
        return subtitleLabel
    }()
    lazy var textView:UITextView = {
        let textView = UITextView(frame: CGRect.null)
        textView.text = "Lorem ipsum dolor sit er elit lamet"
        return textView
    }()
    lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.titleLabel,self.subtitleLabel,self.textView
            ])
        //stack view properties
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    lazy var constraints:[NSLayoutConstraint] = [
        self.stackView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
        self.stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
        self.stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
        self.stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ]
    lazy var iPadConstraints:[NSLayoutConstraint] = [
        self.stackView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
        self.stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 50),
        self.stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: 50),
        self.stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        //stack view constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        checkLayout()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        checkLayout()
    }

    //MARK: Set layout
    func checkLayout() {
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            setiPadLayout()
        } else {
            setOtherLayout()
        }
    }
    func setiPadLayout() {
        subtitleLabel.isHidden = false
        if let first = constraints.first where first.isActive {
            NSLayoutConstraint.deactivate(constraints)
        }
        NSLayoutConstraint.activate(iPadConstraints)
        titleLabel.font = titleLabel.font.withSize(55)
        subtitleLabel.font = subtitleLabel.font.withSize(30)
        textView.font = textView.font?.withSize(25)
    }
    func setOtherLayout() {
        subtitleLabel.isHidden = true
        if let first = iPadConstraints.first where first.isActive {
            NSLayoutConstraint.deactivate(iPadConstraints)
        }
        NSLayoutConstraint.activate(constraints)
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyleTitle1)
        subtitleLabel.font = subtitleLabel.font.withSize(30)
        textView.font = textView.font?.withSize(14)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

