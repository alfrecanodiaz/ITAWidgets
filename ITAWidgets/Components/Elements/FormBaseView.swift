//
//  FormBaseView.swift
//  ITAWidgets
//
//  Created by Alfredo on 10/25/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

class FormBaseView: UIView {
    var border: UIView?
    var borderBottomConstraint: NSLayoutConstraint!
    
    var onTouch: (() -> Void)? {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTouchView(_:)))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(tap)
        }
    }
    
    lazy var labelTitle: UILabel = {
        /// create label
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var action: UIButton = {
        /// create button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(.orange, for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    func addBorder(pinTopToView topView: UIView, withMargin topConstant: CGFloat) {
        self.border = UIView()
        self.border?.backgroundColor = .gray
        
        self.addSubview(self.border!)
        
        self.border?.layout.height(constant: 1)
        
        self.border?.layout.pinLeadingToSuperview(constant: 0)
        self.border?.layout.pinTrailingToSuperview(constant: 0)
        
        self.border?.layout.pinTopToView(view: topView, constant: topConstant)
        
        self.borderBottomConstraint = self.border?.layout.pinBottomToSuperview(constant: 0)
    }
    
    @objc private func onTouchView(_ sender: UITapGestureRecognizer) {
        self.onTouch?()
    }
}
