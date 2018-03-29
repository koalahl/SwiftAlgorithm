//
//  SelectionSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2016/11/28.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
/*
 简单选择排序
 时间复杂度 O(n^2)
 
 算法核心：把i后面的所有元素依次与i位置的元素进行比较
 
 注意与冒泡排序的区别。
*/
func selectionSort<T:Comparable>(array:[T]) ->[T]{
    var a = array
    let startTime = CFAbsoluteTimeGetCurrent()

    for i in 0..<a.count-1 {
        for j in i+1..<a.count {
            if a[j] < a[i] {
                a.swapAt(i, j)

            }
        }
    }
    let finishTime = CFAbsoluteTimeGetCurrent()
    print("SelectionSort Time =",finishTime - startTime)

    return a
}
