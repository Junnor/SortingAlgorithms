//
//  MergeSortViewController.swift
//  SortingAlgorithms
//
//  Created by dq on 2021/4/9.
//

import UIKit

class MergeSortViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextMark("Merge Sort")

        // Sort ---------------
        let before = Helper.demoElements
        let after = mergeSort(before)
        print("Before merge sorting: \(before)")
        print("After merge sorting: \(after)")
        
    }
    
}


// MARK: - Merge sort

/**
 归并排序
 时间复杂度：O(nlog(n))
 
 可以这样理解：递归拆分数组中，如果数组长度为2，那么需要执行1层递归；如果数组长度为4，那么需要执行2层递归，8长度，需要3层递归....
 以此类推，整个数组的时间复杂度是 log2(n)。
 
 而合并的时候，不管合并是的数组大小都需要 n 次。
 
 所以总的时间复杂度是 n * log(n)。
 
 ......
 
 由于拆分合并的中途都产生了临时数组，它的空间复杂度为 O(nlog(n))
 
 
 参考：
 https://github.com/raywenderlich/swift-algorithm-club/tree/master/Merge%20Sort
 */

func mergeSort<Element>(_ elements: [Element]) -> [Element] where Element: Comparable {
    guard elements.count > 1 else { return elements }
    
    let middleIndex = elements.count/2
    
    let leftPile = mergeSort(Array(elements[0..<middleIndex]))
    let rightPile = mergeSort(Array(elements[middleIndex..<elements.count]))
    
    return merge(leftPile, rightPile)
}

private func merge<Element>(_ leftPile: [Element], _ rightPile: [Element]) -> [Element] where Element: Comparable {
    var leftIndex = 0
    var rightIndex = 0
    
    var total: [Element] = []
    total.reserveCapacity(leftPile.count + rightPile.count) //
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            total.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            total.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            total.append(leftPile[leftIndex])
            leftIndex += 1
            
            total.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        total.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        total.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return total
}
