//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by furkan on 6.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var amdLabel: UILabel!
    @IBOutlet weak var brlLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1-) Request & Session
        // 2-) Responce & Data
        // 3-) Parsing & JSON Serialization
        
        // 1. ADIM
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=ed3a9f5276dbfe34ff603bcd26076d59")
        let session = URLSession.shared
        
        //Closure
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }else{
                //2.ADIM
                
                if data != nil{
                    
                    let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String,Any>
                        //ASYNC
                        DispatchQueue.main.async {
                            if let rates = jsonResponse?["rates"] as? [String : Any]{
                                
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["CAD"] as? Double{
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let turkish = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                                if let amd = rates["AMD"] as? Double{
                                    self.amdLabel.text = "AMD: \(amd)"
                                }
                                if let brl = rates["BRL"] as? Double{
                                    self.brlLabel.text = "BRL: \(brl)"
                                }
                            }
                        }
                }
            }
        }
        task.resume()
    }
}

