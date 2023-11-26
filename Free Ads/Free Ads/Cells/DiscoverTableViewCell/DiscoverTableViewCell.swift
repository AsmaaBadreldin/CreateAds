//
//  DiscoverTableViewCell.swift
//  Free Ads
//
//  Created by asmaa badreldin on 25/11/2023.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    var collectionViewObserver: NSKeyValueObservation?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addObserver()
        
        let cellNib = UINib(nibName: "DiscoverCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "DiscoverCollectionViewCell")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    
    deinit {
        collectionViewObserver = nil
    }
    
    func addObserver() {
        collectionViewObserver = collectionView.observe(\.contentSize, changeHandler: { [weak self] (collectionView, change) in
            self?.collectionView.invalidateIntrinsicContentSize()
            self?.collectionHeight.constant = collectionView.contentSize.height
            self?.layoutIfNeeded()
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
