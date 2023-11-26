//
//  CreateAdVC.swift
//  Free Ads
//
//  Created by asmaa badreldin on 26/11/2023.
//

import Foundation
import UIKit

class CreateAdVC: UIViewController {
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var addCreateBtn: UIButton!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setup(){
        addCreateBtn.layer.cornerRadius = 10

        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor(hexString: "#FFB801").cgColor
        
        view2.layer.cornerRadius = 10
        view2.layer.borderWidth = 1
        view2.layer.borderColor = UIColor(hexString: "#FFB801").cgColor
    }
}
