//
//  FormInputView.swift
//  ITAWidgets
//
//  Created by Alfredo on 9/18/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import UIKit

class FormInputView: UIView {
    
    lazy var labelTitle: UILabel = {
        /// create label
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var userHeader: UserHeader = {
        /// create header
        let header = UserHeader(frame: CGRect.zero)
        return header
    }()
    
    lazy var labelClientName: UILabel = {
        /// create label
        let label = UILabel()
        label.textColor = .orange
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var action: UIButton = {
        /// create button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(.orange, for: .normal)
        return button
    }()
    
    var border: UIView?
    private var info: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// setup
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        /// setup
        self.setup()
    }
    
    private func setup() {
        self.addBottomBorder(color: .gray)
        
        /// add title label to superview
        self.addSubview(self.labelTitle)
        self.labelTitle.layout.pinLeadingToSuperview(constant: 0)
        self.labelTitle.layout.pinTrailingToSuperview(constant: 0)
        self.labelTitle.layout.pinTopToSuperview(constant: 0)
        
        /// add user header to superview
        self.addSubview(self.userHeader)
        self.userHeader.layout.pinLeadingToSuperview(constant: 0)
        self.userHeader.layout.pinTopToView(view: self.labelTitle, constant: 8)
        
        /// add client name label to superview
        self.addSubview(self.labelClientName)
        self.labelClientName.layout.pinTopToView(view: self.labelTitle, constant: 8)
        self.labelClientName.layout.pinLeadingToSuperview(constant: 72)
        self.labelClientName.layout.pinTrailingToSuperview(constant: 48)
        
        /// add action button to superview
        self.addSubview(self.action)
        self.action.layout.centerVertically()
        self.action.layout.pinTrailingToSuperview(constant: 0)
        
        /// add border
        self.addBorder()
    }
    
    func addInfo(text: String, withLineBreak: Bool = false, bold: Bool = false) {
        /// create label
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = text
        
        if bold {
            label.font = UIFont.boldSystemFont(ofSize: 14)
        } else {
            label.font = UIFont.systemFont(ofSize: 14)
        }
        
        self.addSubview(label)
        
        if self.info.isEmpty {
            label.layout.pinTopToView(view: self.labelClientName, constant: 4)
        } else {
            label.layout.pinTopToView(view: self.info.last!, constant: withLineBreak ? 8 : 4)
        }
        
        label.layout.pinLeadingToSuperview(constant: 72)
        label.layout.pinTrailingToSuperview(constant: 48)
        
        self.info.append(label)
        self.rearrangeBorder()
    }
    
    private func addBorder() {
        self.border = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 1))
        self.border?.backgroundColor = .clear
        
        self.addSubview(self.border!)
        
        self.border?.layout.pinLeadingToSuperview(constant: 0)
        self.border?.layout.pinTrailingToSuperview(constant: 0)
        
        if self.info.isEmpty {
            self.border?.layout.pinTopToView(view: self.userHeader, constant: 16)
        } else {
            self.border?.layout.pinTopToView(view: self.info.last!, constant: 16)
        }
        
        self.border?.layout.pinBottomToSuperview(constant: 0)
    }
    
    private func rearrangeBorder() {
        self.border?.removeFromSuperview()
        self.addBorder()
    }
}
