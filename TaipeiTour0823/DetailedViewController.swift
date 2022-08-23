//
//  DetailedViewController.swift
//  TaipeiTour0823
//
//  Created by Steve Lai on 2022/8/23.
//

import UIKit

class DetailedViewController: UIViewController {

    
    @IBOutlet weak var pointLabel: UILabel!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
