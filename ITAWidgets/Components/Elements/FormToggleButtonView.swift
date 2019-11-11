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
    var onChange: ((Any?) -> Void)?
    
    private let OPTION_SELECTED = 1
    private let OPTION_UNSELECTED = -1
    
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
        /// create button
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var rightOption: UIButton = {
        /// create button
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
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
        
        /// touch event
        self.stackView.subviews.forEach { view in
            if let button = view as? UIButton {
                button.addTarget(self, action: #selector(self.onOptionSelected(_:)), for: .touchUpInside)
            }
        }
    }
    
    @objc private func onOptionSelected(_ option: UIButton) {
        if option.tag != OPTION_SELECTED {
            self.stackView.subviews.forEach { view in
                view.tag = OPTION_UNSELECTED
                
                if let button = view as? UIButton {
                    /// set style for unselected option
                    button.setTitleColor(.black, for: .normal)
                    button.layer.borderColor = UIColor.gray.cgColor
                    button.backgroundColor = .white
                }
            }
            
            option.tag = OPTION_SELECTED
            option.setTitleColor(.white, for: .normal)
            option.layer.borderColor = UIColor.orange.cgColor
            option.backgroundColor = .orange
        }
        
        self.onChange?(option.data ?? nil)
    }
}
