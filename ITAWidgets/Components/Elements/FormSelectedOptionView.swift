//
//  FormSelectedOptionView.swift
//  ITAWidgets
//
//  Created by Alfredo on 10/22/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

class FormSelectedOptionView: FormBaseView {
    
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
    
    private var info: [UILabel] = []
    
    convenience public init(model: Any?) {
        self.init(frame: CGRect.zero)
        
        /// setup view
        if let model = model {
            self.setupWithModel(model)
        } else {
            self.setupWithoutModel()
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupWithoutModel() {
        /// add title label to superview
        self.addSubview(self.labelTitle)
        self.labelTitle.layout.pinLeadingToSuperview(constant: 0)
        self.labelTitle.layout.pinTrailingToSuperview(constant: 0)
        self.labelTitle.layout.pinTopToSuperview(constant: 0)
        
        /// add action button to superview
        self.addSubview(self.action)
        self.action.layout.centerVertically()
        self.action.layout.pinTrailingToSuperview(constant: 0)
        
        self.border = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 1))
        self.border?.backgroundColor = .clear
        
        self.addSubview(self.border!)
        
        self.addBorder(pinTopToView: self.labelTitle, withMargin: 40)
    }
    
    private func setupWithModel(_ model: Any) {
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
        self.action.layout.pinTopToSuperview(constant: 20)
        self.action.layout.pinTrailingToSuperview(constant: 0)
        
        /// add bottom border
        self.addBorder(pinTopToView: self.info.isEmpty ? self.userHeader : self.info.last!, withMargin: 16)
    }
    
    func addInfo(_ text: String, withLineBreak: Bool = false, bold: Bool = false) {
        /// create label
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = text
        
        if bold {
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textColor = .black
        } else {
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
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
        
        /// rearrangeBorder
        self.border?.removeFromSuperview()
        self.addBorder(pinTopToView: self.info.isEmpty ? self.userHeader : self.info.last!, withMargin: 16)
    }
}
