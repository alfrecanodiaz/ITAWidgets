//
//  ViewController.swift
//  ITAWidgets
//
//  Created by Alfredo on 9/17/19.
//  Copyright © 2019 Itaú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var formView: FormView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup form view
        self.formView.stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        self.formView.stackView.isLayoutMarginsRelativeArrangement = true
        self.formView.stackView.spacing = 8
        
        /// add debit account selector
        let formInputView: FormInputView = FormInputView(frame: CGRect.zero)
//        formInputView.backgroundColor = .blue
        formInputView.labelTitle.text = "cuenta débito"
        formInputView.userHeader.labelInitials.text = "AC"
        formInputView.labelClientName.text = "Julieta Maria Gimenez"
        formInputView.action.setTitle("A", for: .normal)
        formInputView.addInfo(text: "Banco Itaú")
        formInputView.addInfo(text: "ahorro a la vista dólares")
        formInputView.addInfo(text: "nº 484121000")
        formInputView.addInfo(text: "tu saldo Gs. 5.610.000", withLineBreak: true)
        formInputView.addInfo(text: "intercheque Gs. 300.000")
        formInputView.addInfo(text: "disponible Gs. 5.910.000", bold: true)
//        self.formView.stackView.addArrangedSubview(formInputView)
//        formInputView.layout.pinTrailingToSuperview(constant: 16)
//        formInputView.layout.pinLeadingToSuperview(constant: 16)
        
        // Add views
        for _ in 1...10 {
            self.addView()
        }
    }
    
    func addView() {
        let formInputView: FormInputView = FormInputView(frame: CGRect.zero)
        formInputView.labelTitle.text = "cuenta débito"
        formInputView.userHeader.labelInitials.text = "AC"
        formInputView.labelClientName.text = "Julieta Maria Gimenez"
        formInputView.action.setTitle("A", for: .normal)
        formInputView.addInfo(text: "Banco Itaú")
        formInputView.addInfo(text: "ahorro a la vista dólares")
        formInputView.addInfo(text: "nº 484121000")
        formInputView.addInfo(text: "tu saldo Gs. 5.610.000", withLineBreak: true)
        formInputView.addInfo(text: "intercheque Gs. 300.000")
        formInputView.addInfo(text: "disponible Gs. 5.910.000", bold: true)
        self.formView.stackView.addArrangedSubview(formInputView)
    }
    
    @IBAction func jumpToViewAction(_ sender: Any) {
        formView.scrollToItem(index: 11)
    }
}
