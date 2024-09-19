//
//  FirstVC.swift
//  HelloiOS
//
//  Created by user256704 on 1/24/24.
//

import UIKit

class FirstVC: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("VC1 - viewDidLoad")
    }

    //Trying to pass the text in the label to Second view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let svc = segue.destination as? SecondVC else {return}
        // Type casting to second view controller, if can't do it. Then do nothing
        
        svc.str = nameTF.text //Gets the text
        
    }

    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC1 - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC1 - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC1 - viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC1 - viewDidDisappear")
    }*/
}
