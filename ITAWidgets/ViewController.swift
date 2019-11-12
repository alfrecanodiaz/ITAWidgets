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
        self.formView.stackView.spacing = 16
        
        // Add cells
        self.addCells()
    }
    
    func addCells() {
        /// empty form selected card
        self.formView.addCell(FormCell(for: {
            let option: FormSelectedOptionView = FormSelectedOptionView(model: nil)
            option.action.setTitle("A", for: .normal)
            option.labelTitle.text = "cuenta débito"
            return option
        }))
        
        /// filled form selected card
        let selectedView = self.formView.addCell(FormCell(for: {
            let option: FormSelectedOptionView = FormSelectedOptionView(model: String())
            option.action.setTitle("A", for: .normal)
            option.labelTitle.text = "cuenta crédito"
            option.userHeader.labelInitials.text = "AC"
            option.labelClientName.text = "Julieta Maria Gimenez"
            option.action.setTitle("A", for: .normal)
            option.addInfo("Banco Itaú")
            option.addInfo("ahorro a la vista dólares")
            option.addInfo("nº 484121000")
            option.addInfo("tu saldo Gs. 5.610.000", withLineBreak: true)
            option.addInfo("intercheque Gs. 300.000")
            option.addInfo("disponible Gs. 5.910.000", bold: true)
            return option
        }))
        
//        selectedView.isHidden = true
        
        /// amount input
        self.formView.addCell(FormCell(for: {
            let input: FormInputView = FormInputView(type: .amount)
            input.labelTitle.text = "monto"
            input.action.setTitle("A", for: .normal)
            input.labelCurrency.text = "Gs."
            input.textField.placeholder = "0"
            input.textField.keyboardType = .numberPad
            input.tag = 500
            input.onTouch = {
                input.setError(input.isValid ? "No hay saldo suficiente en la cuenta elegida" : nil)
//                self.replaceFirstCell()
//                if let subview = self.formView.viewWithTag(700) {
//                    self.formView.stackView.removeArrangedSubview(subview)
//                }
            }
            return input
        }))
        
        /// toggle button
        self.formView.addCell(FormCell(for: {
            let toggle: FormToggleButtonView = FormToggleButtonView()
            toggle.labelTitle.text = "aviso de transferencia (opicional)"
            toggle.leftOption.setTitle("enviar un e-mail", for: .normal)
            toggle.rightOption.setTitle("enviar un SMS", for: .normal)
            toggle.leftOption.data = "email"
            toggle.rightOption.data = "sms"
            toggle.onChange = { data in
                print(data as! String)
            }
            return toggle
        }))
        
        /// default input
        self.formView.addCell(FormCell(for: {
            let input: FormInputView = FormInputView(type: .default)
            input.labelTitle.text = "email"
            input.textField.placeholder = ""
            input.textField.keyboardType = .alphabet
            input.textField.textColor = .black
            input.textField.font = UIFont.systemFont(ofSize: 18)
            input.tag = 700
            return input
        }))
        
        /// default input
        self.formView.addCell(FormCell(for: {
            let input: FormInputView = FormInputView(type: .default)
            input.labelTitle.text = "mensaje"
            input.textField.placeholder = ""
            input.textField.keyboardType = .alphabet
            input.textField.textColor = .black
            input.textField.font = UIFont.systemFont(ofSize: 18)
            input.maxLength = 10
            input.onTextChange = { textField, range, string in
                /// logic
                return true
            }
            return input
        }))
        
        /// submit button
        self.formView.addCell(FormCell(for: {
            let button: FormSubmitButtonView = FormSubmitButtonView()
            button.target.setTitle("continuar", for: .normal)
            button.verticalEdges?.first?.constant = 16
            return button
        }))
    }
    
    @IBAction func jumpToViewAction(_ sender: Any) {
        formView.scrollToItem(index: 11)
    }
    
    func replaceFirstCell() {
        self.formView.stackView.subviews.first?.removeFromSuperview()
        let selectedView = self.formView.insertCell(FormCell(for: {
            let option: FormSelectedOptionView = FormSelectedOptionView(model: String())
            option.action.setTitle("A", for: .normal)
            option.labelTitle.text = "cuenta débito"
            option.userHeader.labelInitials.text = "AC"
            option.labelClientName.text = "Julieta Maria Gimenez"
            option.action.setTitle("A", for: .normal)
            option.addInfo("Banco Itaú")
            option.addInfo("ahorro a la vista dólares")
            option.addInfo("nº 484121000")
            option.addInfo("tu saldo Gs. 5.610.000", withLineBreak: true)
            option.addInfo("intercheque Gs. 300.000")
            option.addInfo("disponible Gs. 5.910.000", bold: true)
            return option
        }), at: 0)
    }
}
