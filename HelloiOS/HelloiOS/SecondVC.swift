//
//  SecondVC.swift
//  HelloiOS
//
//  Created by user256704 on 1/24/24.
//

import UIKit

class SecondVC: UIViewController {

    
    var str: String?
    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("VC2 - viewDidLoad")
        
        nameLbl.text = str
    }

    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC2 - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC2 - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC2 - viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC2 - viewDidDisappear")
    }*/

}
