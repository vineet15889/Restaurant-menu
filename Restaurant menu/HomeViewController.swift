//
//  HomeViewController.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import UIKit

class HomeViewController: UIViewController{
    fileprivate let cellItems = ["One", "Two", "Three", "Four", "Five", "Six"]
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
}

extension HomeViewController: InfiniteCollectionViewDataSource
{
    func numberOfItems(_ collectionView: UICollectionView) -> Int
    {
        return cellItems.count
    }
    
    func cellForItemAtIndexPath(_ collectionView: UICollectionView, dequeueIndexPath: IndexPath, usableIndexPath: IndexPath)  -> UICollectionViewCell
    {
        let cell = infiniteCollectionView.dequeueReusableCell(withReuseIdentifier: "cellCollectionView", for: dequeueIndexPath) as! ExampleCollectionViewCell
        cell.lbTitle.text = cellItems[usableIndexPath.row]
        return cell
    }
}

extension HomeViewController: InfiniteCollectionViewDelegate
{
    func didSelectCellAtIndexPath(_ collectionView: UICollectionView, usableIndexPath: IndexPath)
    {
        print("Selected cell with name \(cellItems[usableIndexPath.row])")
    }
}
