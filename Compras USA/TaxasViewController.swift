//
//  TaxasViewController.swift
//  Compras USA
//
//  Created by Cristovão Lima on 01/08/22.
//

import UIKit

class TaxasViewController: UIViewController {
    @IBOutlet weak var lbDollar: UILabel!
    @IBOutlet weak var lbTaxes: UILabel!
    @IBOutlet weak var lbIOSDec: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTaxes.text = "Imp. Estado (\(tc.getFormatted(of: tc.stateTax, withCurrency: ""))%)"
        lbIOSDec.text = "IOF (\(tc.getFormatted(of: tc.iof, withCurrency: ""))%)"
        lbDollar.text = tc.getFormatted(of: tc.shoppingValue, withCurrency: "US$ ")
        lbTaxes.text = tc.getFormatted(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormatted(of: tc.iofValue, withCurrency: "US$ ")
        let real = tc.calculate(usigCard: swCard.isOn)
        lbReal.text = tc.getFormatted(of: real, withCurrency: "R$ ")
    }
}
