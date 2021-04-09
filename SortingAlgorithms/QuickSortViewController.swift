//
//  QuickSortViewController.swift
//  SortingAlgorithms
//
//  Created by dq on 2021/4/9.
//

import UIKit

class QuickSortViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = Helper.cneterLabelForText("Quick Sort")
        label.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 200)
        view.addSubview(label)
        
        // Sort ---------------
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
