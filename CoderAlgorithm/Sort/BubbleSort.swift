//
//  BubbleSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/6/5.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
/*冒泡排序
This is a horrible algorithm. There is no reason why you should have to know it.
 时间复杂度：O(n^2)
 
 */

func bubbleSort<T:Comparable>(array:[T]) -> [T] {
    var a = array
    let startTime = CFAbsoluteTimeGetCurrent()
    for n in 0..<a.count {
        print("第\(n)次")
        for i in 0..<a.count - 1 {
            let j = i + 1
            print("---i *** j = \(i)  \(j)")
            if a[j] < a[i] {
                swap(&a[i], &a[j])
                
            }
        }
    }
    let finishTime = CFAbsoluteTimeGetCurrent()
    print("BubbleSort Time =",finishTime - startTime)
    return a
}
