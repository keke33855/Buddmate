//
//  MainViewController.swift
//  badmintonScoring
//
//  Created by dafaMacmini1 on 13/01/2020.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoView.alpha = 0
    }
    
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showScoring", sender: self)
    }
    
    @IBAction func showInfo(_ sender: Any) {
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.infoView.alpha = 1
        })
    }
    
    @IBAction func hideInfo(_ sender: Any) {
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseOut, animations: {
            self.infoView.alpha = 0
        })
    }
}
