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
    var top3Array:[[String:Any]] = [[ : ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rowHeight = 70
        tableview.allowsSelection = false
        tableview.tableFooterView = .none
        tableview.register(UINib(nibName: "TopDishesTableViewCell", bundle: nil), forCellReuseIdentifier: "TopDishesTableViewCell")
    }

    @IBAction func paynow(_ sender: Any) {
        DummyData.shared.refreshData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TopDishesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TopDishesTableViewCell", for: indexPath) as! TopDishesTableViewCell
//        cell.name.text = NSLocalizedString((top3Array[indexPath.row]["Name"] as! String?)!, comment: "")
//        cell.photo.image = UIImage(named:(top3Array[indexPath.row]["image"] as! String))
//        cell.price.text = "₹\(String(describing: top3Array[indexPath.row]["Price"]!))"
//        cell.rating.text = "\(String(describing: top3Array[indexPath.row]["rating"]!))/5"
//        cell.quantity.text = "0"
//        cell.quantity.text = String(describing: top3Array[indexPath.row]["quantity"]!)
        cell.reduce.isHidden = true
        cell.add.isHidden = true
        return cell;
    }
}
