//
//  PaymentViewController.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 23/03/21.
//

import UIKit

class PaymentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var netTotal: UILabel!
    @IBOutlet weak var gst: UILabel!
    @IBOutlet weak var grandTotal: UILabel!
    @IBOutlet weak var tableview: UITableView!
    var orderArray:[[String:Any]] = [[ : ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderArray.removeAll()
        tableview.rowHeight = 70
        tableview.allowsSelection = false
        tableview.tableFooterView = .none
        tableview.register(UINib(nibName: "TopDishesTableViewCell", bundle: nil), forCellReuseIdentifier: "TopDishesTableViewCell")
        self.loadOrderData()
    }

    @IBAction func paynow(_ sender: Any) {
        DummyData.shared.refreshData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(orderArray)
        return orderArray.count;
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TopDishesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TopDishesTableViewCell", for: indexPath) as! TopDishesTableViewCell
//        cell.name.text = NSLocalizedString((orderArray[indexPath.row]["Name"] as! String?)!, comment: "")
//        cell.photo.image = UIImage(named:(orderArray[indexPath.row]["image"] as! String))
//        cell.price.text = "₹\(String(describing: orderArray[indexPath.row]["Price"]!))"
//        cell.rating.text = "\(String(describing: orderArray[indexPath.row]["rating"]!))/5"
//        cell.quantity.text = "0"
//        cell.quantity.text = String(describing: orderArray[indexPath.row]["quantity"]!)
        cell.reduce.isHidden = true
        cell.add.isHidden = true
        return cell;
    }
    
    func loadOrderData(){
        for data in DummyData.shared.food{
            let foodArray:Array = data["Top3"] as! [[String:Any]]
            for item in foodArray {
                let orderQuantity:Int = Int(item["quantity"] as! String)!
                if orderQuantity > 0 {
                    orderArray.append(item)
                }
            }
        }
        tableview.reloadData()
    }
}
