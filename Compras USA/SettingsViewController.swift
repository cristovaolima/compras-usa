//
//  SettingsViewController.swift
//  Compras USA
//
//  Created by Cristovão Lima on 01/08/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tfDollar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfTaxas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDollar.text = tc.getFormatted(of: tc.dollar, withCurrency: "")
        tfIOF.text = tc.getFormatted(of: tc.iof, withCurrency: "")
        tfTaxas.text = tc.getFormatted(of: tc.stateTax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues(){
        tc.dollar = tc.convertDouble(tfDollar.text!)
        tc.iof = tc.convertDouble(tfIOF.text!)
        tc.stateTax = tc.convertDouble(tfTaxas.text!)
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
