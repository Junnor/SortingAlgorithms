//
//  TableViewController.swift
//  SortingAlgorithms
//
//  Created by dq on 2021/4/9.
//

import UIKit

class TableViewController: UITableViewController {
    
    private enum SortType {
        case n2
        case merge
        case quick
        case heap
        case radix
        
        var title: String {
            switch self {
            case .n2: return "Bubble, Selection, Insertion"
            case .merge: return "Merge Sort"
            case .quick: return "Quick Sort"
            case .heap: return "Heap Sort"
            case .radix: return "Radix Sort"
            }
        }
    }

    private let items: [SortType] = [.n2, .merge, .quick, .heap, .radix]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sorting Algorithms"
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = items[indexPath.item].title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc: UIViewController
        switch items[indexPath.item] {
        case .n2: vc = NNSortViewController()
        case .merge: vc = MergeSortViewController()
        case .quick: vc = QuickSortViewController()
        case .heap: vc = HeapSortViewController()
        case .radix: vc = RadixSortViewController()
        }
        vc.view.backgroundColor = traitCollection.userInterfaceStyle == .light ? .white : .black
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


struct Helper {
    
    static var demoElements: [Int] {
        var tmp: [Int] = []
        for i in 1...12 {
            tmp.append(i)
        }
        return tmp.shuffled()
    }
    
    static func cneterLabelForText(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }

}


