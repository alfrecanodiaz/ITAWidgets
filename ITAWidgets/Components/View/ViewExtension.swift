//
//  ViewExtension.swift
//  ITAWidgets
//
//  Created by Alfredo on 9/18/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// generic method that returns an optional object of type UIView. If it fails to load the view, it returns nil.
    class func fromNib<T: UIView>() -> T {
        /// load a XIB file with the same name as the current class instance.
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
