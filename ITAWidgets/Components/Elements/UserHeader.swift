//
//  UserHeader.swift
//  ITAWidgets
//
//  Created by Alfredo on 10/17/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

class UserHeader: UIView {
    
    lazy var circularView: UIView = {
        /// create circular view
        let circularView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        circularView.layer.cornerRadius = circularView.frame.size.width / 2
        circularView.clipsToBounds = true
        circularView.backgroundColor = .lightGray
        return circularView
    }()
    
    lazy var labelInitials: UILabel = {
        /// create label
        let label = UILabel()
        label.textColor = .orange
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
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
        /// add circular view to superview
        self.addSubview(self.circularView)
        
        /// add label to superview
        self.circularView.addSubview(self.labelInitials)
        self.labelInitials.layout.centerVertically()
        self.labelInitials.layout.centerHorizontally()
    }
}
