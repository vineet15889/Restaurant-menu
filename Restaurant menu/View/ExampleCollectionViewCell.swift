//
//  ExampleCollectionViewCell.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource {
    var tableview:UITableView!
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
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TopDishesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TopDishesTableViewCell", for: indexPath) as! TopDishesTableViewCell
        return cell;
    }
}
