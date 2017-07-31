//
//  ProgressVC.swift
//  TestDemo
//
//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

import UIKit

class ProgressVC: UIViewController {

    
    let linearBar: LinearProgressBar = LinearProgressBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Progress"
        self.configureLinearProgressBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func btnClickedOnStart(_ sender: Any) {
        self.linearBar.startAnimation()
        
    }
    
    @IBAction func btnClickedOnStop(_ sender: Any) {
        self.linearBar.stopAnimation()
    
    }
    
    fileprivate func configureLinearProgressBar(){
        linearBar.backgroundColor = UIColor(red:0.68, green:0.81, blue:0.72, alpha:1.0)
        linearBar.progressBarColor = UIColor(red:0.26, green:0.65, blue:0.45, alpha:1.0)
        linearBar.heightForLinearBar = 5
    }

}
