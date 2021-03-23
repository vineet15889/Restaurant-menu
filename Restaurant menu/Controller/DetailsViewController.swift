//
//  DetailsViewController.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet weak var tableview: UITableView!
    var top3Array:[[String:Any]] = [[ : ]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rowHeight = 70
        tableview.allowsSelection = false
        tableview.tableFooterView = .none
        tableview.register(UINib(nibName: "TopDishesTableViewCell", bundle: nil), forCellReuseIdentifier: "TopDishesTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return top3Array.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TopDishesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TopDishesTableViewCell", for: indexPath) as! TopDishesTableViewCell
        cell.name.text = NSLocalizedString((top3Array[indexPath.row]["Name"] as! String?)!, comment: "")
        cell.photo.image = UIImage(named:(top3Array[indexPath.row]["image"] as! String))
        cell.price.text = "₹\(String(describing: top3Array[indexPath.row]["Price"]!))"
        cell.rating.text = "\(String(describing: top3Array[indexPath.row]["rating"]!))/5"
        cell.reduce.mk_addTapHandler { (btn) in
             self.reduceTapped(btn: btn, indexPath: indexPath)
        }
        cell.add.mk_addTapHandler { (btn) in
             self.addTapped(btn: btn, indexPath: indexPath)
        }
        return cell;
    }
    

    func reduceTapped(btn:UIButton, indexPath:IndexPath) {
        var count:Int = Int(top3Array[indexPath.row]["quantity"] as! String)!
        if  count > 0 {
            if let cell = tableview.cellForRow(at: indexPath) as? TopDishesTableViewCell{
                count = count - 1
                cell.quantity.text = String(describing:count)
                top3Array[indexPath.row]["quantity"] = String(describing:count)
            }
        }
    }
    func addTapped(btn:UIButton, indexPath:IndexPath) {
        var count:Int = Int(top3Array[indexPath.row]["quantity"] as! String)!
        if let cell = tableview.cellForRow(at: indexPath) as? TopDishesTableViewCell{
            count = count + 1
            cell.quantity.text = String(describing:count)
            top3Array[indexPath.row]["quantity"] = String(describing:count)
        }
    }
    @IBAction func payment(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:PaymentViewController = storyboard.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        vc.title  = "Cart 🛒"
        self.navigationController?.pushViewController (vc, animated: true)
    }
    
    
}
