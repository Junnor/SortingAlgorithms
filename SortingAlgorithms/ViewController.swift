//
//  ViewController.swift
//  SortingAlgorithms
//
//  Created by dq on 2021/4/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

var demoElements: [Int] {
    var tmp: [Int] = []
    for i in 1...12 {
        tmp.append(i)
    }
    return tmp.shuffled()
}
