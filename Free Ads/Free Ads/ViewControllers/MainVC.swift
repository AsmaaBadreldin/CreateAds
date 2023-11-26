//
//  MainVC.swift
//  Free Ads
//
//  Created by asmaa badreldin on 25/11/2023.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var addCreateBtn: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var view2: UIView!
    
    var categoriesArray:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpDesign()
        
        setUpData()
    }

    func setUpDesign(){
        tableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "DiscoverTableViewCell")
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor(hexString: "#FFB801").cgColor
        
        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor(hexString: "#FFB801").cgColor

        view2.layer.cornerRadius = 10
        view2.layer.borderWidth = 1
        view2.layer.borderColor = UIColor(hexString: "#FFB801").cgColor

        addCreateBtn.layer.cornerRadius = 10

    }
    
    func setUpData(){
        categoriesArray = ["Cloth","Food","Beauty","Cloth","Food","Beauty","Cloth","Food","Beauty"]
    }
    
    @IBAction func addCreateHandler(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CreateAdVC") as! CreateAdVC
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.reloadData()
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverTableViewCell") as? DiscoverTableViewCell else { return UITableViewCell() }

            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as? CategoryTableViewCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let discoverCell = cell as? DiscoverTableViewCell {
            discoverCell.collectionView.dataSource = self
            discoverCell.collectionView.delegate = self
            discoverCell.collectionView.tag = indexPath.section //0
            discoverCell.collectionView.reloadData()

        }
        if let categoryCell = cell as? CategoryTableViewCell{
            // tab of the collectionview
            categoryCell.categoriesCollectionView.dataSource = self
            categoryCell.categoriesCollectionView.delegate = self
            categoryCell.categoriesCollectionView.tag = -1 //-1
            categoryCell.categoriesCollectionView.reloadData()
            
            categoryCell.collectionView.dataSource = self
            categoryCell.collectionView.delegate = self
            categoryCell.collectionView.tag = indexPath.section
            categoryCell.collectionView.reloadData()
        }
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return 6
        }else if collectionView.tag == -1{
            return categoriesArray.count
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCollectionViewCell", for: indexPath) as? DiscoverCollectionViewCell else{ return UICollectionViewCell()}
            return cell
        }else if collectionView.tag == -1{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesTabCell", for: indexPath) as? CategoriesTabCell else{ return UICollectionViewCell()}
            cell.setup(titleStr: categoriesArray[indexPath.row])
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else{ return UICollectionViewCell()}
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
            return CGSize(width : 150, height: 160)
        }else if collectionView.tag == -1{
            return CGSize(width : 100 , height: collectionView.frame.height)
        } else{
            return CGSize(width : collectionView.frame.width / 2.1 , height: 300)
        }
    }

}

