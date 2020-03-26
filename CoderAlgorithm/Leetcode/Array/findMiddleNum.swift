//
//  findNum.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/23.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**
 [3,2,5,8,9,6,11] ，找到满足左边都比当前元素小，右边都比当前元素大的元素。如果左边或者t右边没有元素，则表示满足条件
 输出：[5,11]
*/
func findNum(_ array: [Int]) -> [Int] {
    //解法一：直觉解法，暴力枚举 时间复杂度O（n^2)
    var result = Array<Int>()
  
    for (i, curr) in array.enumerated() {
        let leftSubArray  = array[0..<i]
        let rightSubArray = array[i...(array.count - 1)]
        
        var max_left = true//是否比左边的都大
        for sub_left in leftSubArray {
            if sub_left > curr {
                max_left = false
            }
        }
        var min_right = true//是否比右边的都小
        for sub_right in rightSubArray {
            if sub_right < curr {
                min_right = false
            }
        }
        
        if max_left && min_right {
            result.append(curr)
        }
    }
    
    return result
}

func findNum2(_ array: [Int]) -> [Int] {

    let length = array.count
    //[3,2,5,8,9,6,11]
    var result = Array<Int>()
    //声明一个
    var candidite = Array(repeating: 0, count: length)
    candidite[length - 1] = array[length - 1]
    
    //On解法的关键是构造出candidite数组，从右到左遍历求一个rightMin数组，记录array[i]右边的最小值。
    let rightSubArray = array[0...(length - 2)]
    for (i,_) in rightSubArray.enumerated().reversed() {
        if (array[i] < candidite[i + 1]) {
            candidite[i] = array[i];
        }else{
            candidite[i] = candidite[i + 1];
        }
    }
    //candidite ： [2,2,5,6,6,6,11]
    var max_left  = array[0]
    for (i, curr) in array.enumerated() {
        max_left = max(array[i],max_left)
        //
        if max_left == candidite[i] {
            result.append(curr)
        }
    }
    //output:[5, 11]
    return result
}
