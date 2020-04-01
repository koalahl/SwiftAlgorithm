//
//  The Shortest subArray need be sorted.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/26.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**
 一个数组中需要被排序的最短子数组
 [3,4,7,5,2,11,8,9,10]
 output: [7,5,2,11,8,9,10]
 
 [5,8,9,6,11]
 output: [8,9,6]
 
 时间复杂度O（n）空间复杂度O（1）
 */

func getMinLengthSubArray(_ array: [Int]) -> [Int] {
    if array.count <= 2 {
        return []
    }
    let length = array.count
    
    //记录右侧最小值
    var min_right = array[length - 1]
    var minIndex = -1
    
    for (i,_) in array[0...length-2].enumerated().reversed() {
        if array[i] > min_right {
            minIndex = i
        }else {
            min_right = min(array[i],min_right)
        }
    }
    //如果每个元素都是小于它右侧元素的，则说明原数组本身就是排序的
    if minIndex == -1 {
        return []
    }
    
    //记录左侧最大值
    var max_left  = array[0]
    var maxIndex = -1

    for (i,_) in array.enumerated() {
        if array[i] < max_left {
            maxIndex = i
        }else {
            max_left = max(array[i],max_left)
        }
    }

    let arr = array[minIndex...maxIndex]
    return Array(arr)
}











