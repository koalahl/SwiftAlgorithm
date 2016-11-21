//
//  BubbleSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/6/5.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
//冒泡排序
/*This is a horrible algorithm. There is no reason why you should have to know it.*/

func bubbleSort<T:Comparable>(array:[T]) -> [T] {
    var a = array
    
    for i in 0..<a.count-1 {
        for j in i+1..<a.count {
            if a[j] < a[i] {
                swap(&a[i], &a[j])
            }
        }
    }
    return a
}