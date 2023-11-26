//
//  CategoriesTabCell.swift
//  Free Ads
//
//  Created by asmaa badreldin on 26/11/2023.
//

import UIKit

class CategoriesTabCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(titleStr:String){
        titleLbl.text = titleStr
    }
}
