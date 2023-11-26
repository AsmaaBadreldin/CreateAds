//
//  DiscoverCollectionViewCell.swift
//  Free Ads
//
//  Created by asmaa badreldin on 25/11/2023.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(hexString: "#FFB801").cgColor
    }

}
