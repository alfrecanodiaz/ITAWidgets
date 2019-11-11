//
//  FormSubmitButtonView.swift
//  ITAWidgets
//
//  Created by Alfredo on 11/8/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

class FormSubmitButtonView: FormBaseView {
    var verticalEdges: [NSLayoutConstraint]?
    
    lazy var target: UIButton = {
        /// create button
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor.orange.cgColor
        button.backgroundColor = .orange
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
        /// setup superview
        self.backgroundColor = .clear
        
        /// add button to the view
        self.addSubview(self.target)
        self.target.layout.height(constant: 48)
        self.target.layout.pinHorizontalEdgesToSuperView()
        self.verticalEdges = self.target.layout.pinVerticalEdgesToSuperView()
    }
}
