//
//  HomeViewController.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var infiniteCollectionView: InfiniteCollectionView!
    {
        didSet
        {
            infiniteCollectionView.backgroundColor = UIColor.white
            infiniteCollectionView.register(UINib(nibName: "ExampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellCollectionView")
            infiniteCollectionView.infiniteDataSource = self
            infiniteCollectionView.infiniteDelegate = self
            infiniteCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let flowlayout = UICollectionViewFlowLayout()
         flowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 8, height: infiniteCollectionView.frame.size.height)
         flowlayout.minimumInteritemSpacing = 0
         flowlayout.minimumLineSpacing = 0
         flowlayout.scrollDirection = .horizontal
        infiniteCollectionView.collectionViewLayout = flowlayout
    }
    
    @IBAction func gotoPayment(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:PaymentViewController = storyboard.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        vc.title  = "Cart 🛒"
//        vc.top3Array = DummyData.shared.food[usableIndexPath.row]["Top3"] as! [[String:Any]]
        self.navigationController?.pushViewController (vc, animated: true)
        
    }
    
    @IBAction func english(_ sender: Any) {
        self.languageButtonAction(language: "en")
        
    }
    
    @IBAction func hindi(_ sender: Any) {
        self.languageButtonAction(language:"hi")
    }
    func languageButtonAction(language:String) {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        Bundle.setLanguage(language)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()
    }
}



extension HomeViewController: InfiniteCollectionViewDataSource{
    func numberOfItems(_ collectionView: UICollectionView) -> Int{
        return DummyData.shared.food.count
    }
    
    func cellForItemAtIndexPath(_ collectionView: UICollectionView, dequeueIndexPath: IndexPath, usableIndexPath: IndexPath)  -> UICollectionViewCell{
        let cell = infiniteCollectionView.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: dequeueIndexPath) as! ExampleCollectionViewCell
        cell.lbTitle.text = NSLocalizedString((DummyData.shared.food[usableIndexPath.row]["Name"] as? String)!, comment: "") 
        cell.background.image = UIImage(named:DummyData.shared.food[usableIndexPath.row]["image"] as? String ?? "north-indian")
        cell.index = usableIndexPath.row
        cell.reloadTop3()
        return cell
    }
}

extension HomeViewController: InfiniteCollectionViewDelegate{
    func didSelectCellAtIndexPath(_ collectionView: UICollectionView, usableIndexPath: IndexPath){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:DetailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.title  = NSLocalizedString((DummyData.shared.food[usableIndexPath.row]["Name"] as? String)!, comment: "")
        vc.top3Array = DummyData.shared.food[usableIndexPath.row]["Top3"] as! [[String:Any]]
        self.navigationController?.pushViewController (vc, animated: true)
    }
}
