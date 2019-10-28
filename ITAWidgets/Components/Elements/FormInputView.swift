//
//  FormInputView.swift
//  ITAWidgets
//
//  Created by Alfredo on 9/18/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import UIKit

class FormInputView: FormBaseInputView {
    
    lazy var labelCurrency: UILabel = {
        /// create label
        let label = UILabel()
        label.textColor = .orange
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var textField: UITextField = {
       /// create textfield
        let textField = UITextField()
        textField.textColor = .orange
        textField.font = UIFont.systemFont(ofSize: 32)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        self.addBottomBorder(color: .gray)
        
        /// add title label to superview
        self.addSubview(self.labelTitle)
        self.labelTitle.layout.pinLeadingToSuperview(constant: 0)
        self.labelTitle.layout.pinTrailingToSuperview(constant: 0)
        self.labelTitle.layout.pinTopToSuperview(constant: 0)
        
        /// add action button to superview
        self.addSubview(self.action)
        self.action.layout.pinTopToSuperview(constant: 20)
        self.action.layout.pinTrailingToSuperview(constant: 0)
        
        /// add currency label to superview
        self.addSubview(self.labelCurrency)
        self.labelCurrency.layout.pinLeadingToSuperview(constant: 0)
        self.labelCurrency.layout.pinTopToView(view: self.labelTitle, constant: 16)
        self.labelCurrency.layout.pinBottomToSuperview(constant: 0)
        
        /// add text field to superview
        self.addSubview(self.textField)
        self.textField.layout.pinLeadingToView(view: self.labelCurrency, constant: 8)
        self.textField.layout.pinTrailingToView(view: self.action, constant: 8)
        self.textField.layout.pinTopToView(view: self.labelTitle, constant: 16)
        
        /// add bottom border
        self.addBorder(pinTopToView: self.textField, withMargin: 12)
    }
}
