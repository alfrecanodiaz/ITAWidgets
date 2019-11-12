//
//  FormComponentView.swift
//  ITAWidgets
//
//  Created by Alfredo on 10/17/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

struct Layout {
    
    let element: UIView
    
    init(_ element: UIView) {
        self.element = element
    }
    
    // MARK: Layout
    
    @discardableResult func pinHorizontalEdgesToSuperView(padding: CGFloat = 0) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[view]-(padding)-|",
                                                         options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                         metrics: ["padding": padding],
                                                         views: ["view": element])
        safeSuperview().addConstraints(constraints)
        return constraints
    }
    
    @discardableResult func pinVerticalEdgesToSuperView(padding: CGFloat = 0) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(padding)-[view]-(padding)-|",
                                                         options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                         metrics: ["padding": padding],
                                                         views: ["view": element])
        safeSuperview().addConstraints(constraints)
        return constraints
    }
    
    @discardableResult func centerVertically() -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .centerY,
                                            relatedBy: .equal,
                                            toItem: safeSuperview(),
                                            attribute: .centerY,
                                            multiplier: 1.0, constant: 0)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func centerHorizontally() -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: safeSuperview(),
                                            attribute: .centerX,
                                            multiplier: 1.0, constant: 0)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinLeadingToSuperview(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: safeSuperview(),
                                            attribute: .leading,
                                            multiplier: 1, constant: constant)
        
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinLeadingToView(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .trailing,
                                            multiplier: 1, constant: constant)
        
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinTrailingToSuperview(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: safeSuperview(),
                                            attribute: .trailing,
                                            multiplier: 1, constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinTrailingToView(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .leading,
                                            multiplier: 1, constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinTopToSuperview(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: safeSuperview(),
                                            attribute: .top,
                                            multiplier: 1, constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinTopToView(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .bottom,
                                            multiplier: 1, constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinBottomToSuperview(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: safeSuperview(),
                                            attribute: .bottom,
                                            multiplier: 1, constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func pinBottomToView(view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .top,
                                            multiplier: 1, constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func height(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult func width(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: constant)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    func fillSuperview(padding: CGFloat = 0) {
        safeSuperview()
        pinHorizontalEdgesToSuperView(padding: padding)
        pinVerticalEdgesToSuperView(padding: padding)
    }
    
    @discardableResult func centerVerticallyToView(view: UIView) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: element,
                                            attribute: .centerY,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .centerY,
                                            multiplier: 1.0, constant: 0)
        safeSuperview().addConstraint(constraint)
        return constraint
    }
    
    @discardableResult private func safeSuperview() -> UIView {
        element.translatesAutoresizingMaskIntoConstraints = false
        guard let view = element.superview else {
            fatalError("You need to have a superview before you can add contraints")
        }
        return view
    }
    
}


extension UIView {
    
    var layout: Layout {
        return Layout(self)
    }
}
