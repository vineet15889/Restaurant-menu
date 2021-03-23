//
//  ExampleCollectionViewCell.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {
    var tableview:UITableView!
    var index:Int = 0
    var top3Array:[[String:Any]] = [[ : ]]
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        tableview = UITableView()
        tableview.frame =  CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 210 )
        self .addSubview(tableview)
        tableview.center = CGPoint(x: (UIScreen.main.bounds.size.width/2) - 5, y: (UIScreen.main.bounds.size.height/2) + 50)
        tableview.layer.cornerRadius = 8;
        tableview.alpha = 0.9
        tableview.allowsSelection = false
        tableview.rowHeight = 70
        tableview.register(UINib(nibName: "TopDishesTableViewCell", bundle: nil), forCellReuseIdentifier: "TopDishesTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func reloadTop3(){
        top3Array = DummyData.shared.food[index]["Top3"] as! [[String:Any]]
        print(top3Array)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return top3Array.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TopDishesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TopDishesTableViewCell", for: indexPath) as! TopDishesTableViewCell
        cell.name.text =  NSLocalizedString((top3Array[indexPath.row]["Name"] as! String?)!, comment: "")
        cell.photo.image = UIImage(named:(top3Array[indexPath.row]["image"] as! String))
        cell.price.text = "₹\(String(describing: top3Array[indexPath.row]["Price"]!))"
        cell.rating.text = "\(String(describing: top3Array[indexPath.row]["rating"]!))/5"
        cell.quantity.text = "0"
        cell.quantity.text = String(describing: top3Array[indexPath.row]["quantity"]!)
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
                DummyData.shared.updateData(cusineIndex: index, foodIndex: indexPath.row, quantity: count)
                self.reloadTop3()
            }
        }
    }
    func addTapped(btn:UIButton, indexPath:IndexPath) {
        var count:Int = Int(top3Array[indexPath.row]["quantity"] as! String)!
        if let cell = tableview.cellForRow(at: indexPath) as? TopDishesTableViewCell{
            count = count + 1
            cell.quantity.text = String(describing:count)
            DummyData.shared.updateData(cusineIndex: index, foodIndex: indexPath.row, quantity: count)
            self.reloadTop3()
        }
    }
}

extension UIButton {
    private class Action {
        var action: (UIButton) -> Void

        init(action: @escaping (UIButton) -> Void) {
            self.action = action
        }
    }

    private struct AssociatedKeys {
        static var ActionTapped = "actionTapped"
    }

    private var tapAction: Action? {
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionTapped, newValue, .OBJC_ASSOCIATION_RETAIN) }
        get { return objc_getAssociatedObject(self, &AssociatedKeys.ActionTapped) as? Action }
    }


    @objc dynamic private func handleAction(_ recognizer: UIButton) {
        tapAction?.action(recognizer)
    }


    func mk_addTapHandler(action: @escaping (UIButton) -> Void) {
        self.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        tapAction = Action(action: action)

    }
}
