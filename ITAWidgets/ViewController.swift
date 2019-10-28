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
        
        // Add views
        
        /// empty form selected card
        self.selectedCardWithoutModel()
        /// filled form selected card
        self.selectedCardWithModel()
        /// normal input
        self.normalInput()
    }
    
    func selectedCardWithoutModel() {
        let option: FormSelectedOptionView = FormSelectedOptionView(frame: CGRect.zero)
        option.setup()
        option.action.setTitle("A", for: .normal)
        option.labelTitle.text = "cuenta débito"
        self.formView.stackView.addArrangedSubview(option)
    }
    
    func selectedCardWithModel() {
        let option: FormSelectedOptionView = FormSelectedOptionView(frame: CGRect.zero)
        option.setup(model: option)
        option.action.setTitle("A", for: .normal)
        option.labelTitle.text = "cuenta crédito"
        option.userHeader.labelInitials.text = "AC"
        option.labelClientName.text = "Julieta Maria Gimenez"
        option.action.setTitle("A", for: .normal)
        option.addInfo(text: "Banco Itaú")
        option.addInfo(text: "ahorro a la vista dólares")
        option.addInfo(text: "nº 484121000")
        option.addInfo(text: "tu saldo Gs. 5.610.000", withLineBreak: true)
        option.addInfo(text: "intercheque Gs. 300.000")
        option.addInfo(text: "disponible Gs. 5.910.000", bold: true)
        self.formView.stackView.addArrangedSubview(option)
    }
    
    func normalInput() {
        let input: FormInputView = FormInputView(frame: CGRect.zero)
        input.setup()
        input.labelTitle.text = "monto"
        input.action.setTitle("A", for: .normal)
        input.labelCurrency.text = "Gs."
        input.textField.placeholder = "0"
        input.textField.keyboardType = .numberPad
        self.formView.stackView.addArrangedSubview(input)
    }
    
    @IBAction func jumpToViewAction(_ sender: Any) {
        formView.scrollToItem(index: 11)
    }
}
