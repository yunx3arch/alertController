//
//  ViewController.swift
//  alertController
//
//  Created by Yun Xu on 10/12/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var lblStock: UILabel!
    var globalTxtField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let stock = Stock()
        stock.symbol = "AMZN"
        stock.price = 7872.61
        stock.volume = 2393482
        
        do{
            let realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL)
            try realm.write{
                realm.add(stock, update: .modified)
                //realm.delete(stock)
           }
        }
        catch{
            print("error in adding to database \(error)")
        }
    }

    @IBAction func addAlertController(_ sender: Any) {
        let alertController = UIAlertController(title:"add stock value", message:"stock symbol", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default){
            action in
            print("I am inside OK button")
            self.lblStock.text = self.globalTxtField?.text
        }
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel){
            action in
            print("I am inside cancel button")
        }
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        alertController.addTextField{stockTextField in
            stockTextField.placeholder = "stock symbol"
            //self.lblStock.text = stockTextField.text
            self.globalTxtField = stockTextField
            
        }
        self.present(alertController, animated: true, completion: nil)

    }
    
}

