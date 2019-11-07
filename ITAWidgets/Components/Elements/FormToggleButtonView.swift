//
//  FormToggleButtonView.swift
//  ITAWidgets
//
//  Created by Alfredo on 11/6/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

class FormToggleButtonView: FormBaseView {
    
    private lazy var stackView: UIStackView = {
        /// create stack view
        let stackView = UIStackView(arrangedSubviews: [self.leftOption, self.rightOption])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var leftOption: UIButton = {
        /// create label
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var rightOption: UIButton = {
        /// create label
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        return button
    }()
    
    convenience public init() {
        self.init(frame: CGRect.zero)
        
        /// setup view
        self.setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        /// add title label to superview
        self.addSubview(self.labelTitle)
        self.labelTitle.layout.pinLeadingToSuperview(constant: 0)
        self.labelTitle.layout.pinTrailingToSuperview(constant: 0)
        self.labelTitle.layout.pinTopToSuperview(constant: 0)
        
        /// add container stack view
        self.addSubview(self.stackView)
        self.stackView.layout.pinTopToView(view: self.labelTitle, constant: 16)
        self.stackView.layout.pinLeadingToSuperview(constant: 0)
        self.stackView.layout.pinTrailingToSuperview(constant: 0)
        self.stackView.layout.pinBottomToSuperview(constant: 0)
    }
}
