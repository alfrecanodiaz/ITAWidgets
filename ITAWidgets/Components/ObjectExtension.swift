//
//  ObjectExtension.swift
//  ITAWidgets
//
//  Created by Alfredo on 11/11/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation

extension NSObject {
    
    private struct AssociatedKeys {
        static var data = "object_custom_data"
    }
    
    var data: Any? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.data)
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.data,
                    newValue,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}
