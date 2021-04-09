//
//  NNSortViewController.swift
//  SortingAlgorithms
//
//  Created by dq on 2021/4/9.
//

import UIKit

class NNSortViewController: UIViewController {
    
    private enum N2SortType {
        case bubble
        case selection
        case insertion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextMark("Bubble\n Selection\n Insertion")
        
        // Sort ---------------
        var sortType: N2SortType!
        sortType = .insertion
        
        var elements = Helper.demoElements
        print("[\(sortType!) sort] Before sorting: \(elements)")
        
        switch sortType! {
        case .bubble:
            bubbleSort(&elements)
        case .selection:
            selectionSort(&elements)
        case .insertion:
            insertionSort(&elements)
        }
        print("[\(sortType!) sort] After sorting: \(elements)")
    }
    
}


// MARK: - Bubble sort

/** O(n*n)
 
 每一次的对比都需要调用 swap 函数
 */

func bubbleSort<Element>(_ elements: inout [Element]) where Element: Comparable {
    guard elements.count >= 2 else { return }
    
    // Index: end, current
    for end in (1..<elements.count).reversed() {
        var swapped = false
        for current in 0..<end {
            if elements[current] > elements[current+1] {
                elements.swapAt(current, current+1)
                swapped = true
            }
        }
        if !swapped {
            return
        }
    }
}

// MARK: - Selection sort

/** O(n*n)
 
 只在最后一次的对比的时候调用 swap 函数
 */

func selectionSort<Element>(_ elements: inout [Element]) where Element: Comparable {
    guard elements.count >= 2 else { return }
    
    // Index: end, current, largestIndex
    for end in (1..<elements.count).reversed() {
        var biggest = 0
        for current in 1...end {
            if elements[current] > elements[biggest] {
                biggest = current
            }
        }
        if end != biggest {
            elements.swapAt(end, biggest)
        }
    }
}

// MARK: - Insertion sort

/** O(n*n)
 
 里面开始的时候已排序的元素越多，排序的越快。
 swift 的排序算法混合了插入排序， 当少数组元素的时候使用了插入排序。
 
 https://github.com/raywenderlich/swift-algorithm-club/tree/master/Insertion%20Sort
 */

func insertionSort<Element>(_ elements: inout [Element]) where Element: Comparable {
    guard elements.count >= 2 else { return }
    
    // Index: current, shifting
    for current in 1..<elements.count {
        for shifting in (1...current).reversed() {
            if elements[shifting] < elements[shifting-1] {
                elements.swapAt(shifting, shifting-1)
            } else {
                break // 不用处理了，退出当前 for 循环
            }
        }
    }
}
