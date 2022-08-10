//
//  ViewController.swift
//  Compras USA
//
//  Created by Cristovão Lima on 01/08/22.
//

import UIKit

class ShoppingViewController: UIViewController {
    @IBOutlet weak var tfDollar: UITextField!
    @IBOutlet weak var lbRealDec: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDollar.resignFirstResponder()
        setAmmount()
    }
    
    func setAmmount() {
        tc.shoppingValue = tc.convertDouble(tfDollar.text!)
        lbReal.text = tc.getFormatted(of: tc.shoppingValue * tc.dollar, withCurrency: "R$ ")
        let dolar = tc.getFormatted(of: tc.dollar, withCurrency: "")
        lbRealDec.text = "Valor sem impostos (dólar \(dolar))"
    }
}
