//
//  FormCell.swift
//  ITAWidgets
//
//  Created by Alfredo on 11/5/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import Foundation
import UIKit

class FormCell {
    var cell: (() -> FormBaseView)!
    
    init(for cell: (() -> FormBaseView)? = nil) {
        self.cell = cell
    }
}
