//
//  FormInputView.swift
//  ITAWidgets
//
//  Created by Alfredo on 9/18/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import UIKit

class FormInputView: FormBaseView {
    
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
        textField.delegate = self
        return textField
    }()
    
    var labelError: UILabel?
    var iconError: UIButton?
    
    var isValid: Bool = true
    var maxLength: Int?
    var onTextChange: ((UITextField, NSRange, String) -> Bool)?
    
    convenience public init(type: FormInputType) {
        self.init(frame: CGRect.zero)
        
        /// setup view
        self.setup(type: type)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup(type: FormInputType) {
        /// add title label to superview
        self.addSubview(self.labelTitle)
        self.labelTitle.layout.pinLeadingToSuperview(constant: 0)
        self.labelTitle.layout.pinTrailingToSuperview(constant: 0)
        self.labelTitle.layout.pinTopToSuperview(constant: 0)
        
        if type == .amount {
            /// add action button to superview
            self.addSubview(self.action)
            self.action.layout.pinTopToSuperview(constant: 20)
            self.action.layout.pinTrailingToSuperview(constant: 0)
            
            /// add currency label to superview
            self.addSubview(self.labelCurrency)
            self.labelCurrency.layout.pinLeadingToSuperview(constant: 0)
            self.labelCurrency.layout.pinTopToView(view: self.labelTitle, constant: 16)
        }
        
        /// add text field to superview
        self.addSubview(self.textField)
        
        if type == .default {
            self.textField.layout.pinLeadingToSuperview(constant: 0)
            self.textField.layout.pinTrailingToSuperview(constant: 0)
            self.textField.layout.pinTopToView(view: self.labelTitle, constant: 8)
        } else {
            self.textField.layout.pinLeadingToView(view: self.labelCurrency, constant: 8)
            self.textField.layout.pinTrailingToView(view: self.action, constant: 8)
            self.textField.layout.pinTopToView(view: self.labelTitle, constant: 16)
        }
        
        /// add bottom border
        self.addBorder(pinTopToView: self.textField, withMargin: 12)
        
        /// pin currency label to border
        if type == .amount {
            self.labelCurrency.layout.pinBottomToView(view: self.border!, constant: 0)
        }
    }
    
    func setError(_ message: String?) {
        if let message = message {
            self.isValid = false
            
            self.borderBottomConstraint.isActive = false
            
            /// create label
            let label = UILabel()
            label.textColor = .purple
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = message
            
            self.addSubview(label)
            
            label.layout.pinTopToView(view: self.border!, constant: 4)
            label.layout.pinLeadingToSuperview(constant: 32)
            label.layout.pinTrailingToSuperview(constant: 0)
            label.layout.pinBottomToSuperview(constant: 0)
            
            self.labelError = label
            
            /// create icon
            let icon = UIButton()
            icon.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            icon.setTitleColor(.purple, for: .normal)
            icon.setTitle("A", for: .normal)
            
            self.addSubview(icon)
            
            icon.layout.pinLeadingToSuperview(constant: 0)
            icon.layout.pinTopToView(view: self.border!, constant: 4)
            
            self.iconError = icon
            
            self.labelTitle.textColor = .purple
            self.border?.backgroundColor = .purple
        } else {
            self.isValid = true
            
            self.labelError?.removeFromSuperview()
            self.iconError?.removeFromSuperview()
            
            self.borderBottomConstraint.isActive = true
            
            self.labelTitle.textColor = .gray
            self.border?.backgroundColor = .gray
        }
    }
}

extension FormInputView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let maxLength = self.maxLength {
            let newLength = text.count + string.count - range.length
            
            if newLength > maxLength {
                return false
            }
        }
        
        return self.onTextChange?(textField, range, string) ?? true
    }
}

enum FormInputType {
    case `default`
    case amount
}
