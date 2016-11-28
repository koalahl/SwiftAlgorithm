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
*/
func selectionSort<T:Comparable>(array:[T]) ->[T]{
    var a = array
        for i in 0..<a.count-1 {
            print("---i = \(i)")
            for j in i+1..<a.count {
                print("****j = \(j)")
                if a[j] < a[i] {
                    swap(&a[i], &a[j])
    
                }
            }
        }
    return a
}
