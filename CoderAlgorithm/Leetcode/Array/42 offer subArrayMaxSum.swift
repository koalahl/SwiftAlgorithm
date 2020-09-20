//
//  42 offer subArrayMaxSum.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/7/7.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 剑指 Offer 42. 连续子数组的最大和
 输入一个整型数组，数组里有正数也有负数。数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。
 示例1:
 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 */
func subArrayMaxSub(_ array: [Int]) -> Int {
    //最优解法：动态规划 easy
    var ans = array[0]
    //不修改array的值，所以定义两个变量用来保存array[i-1]和array[i]的值
    var prev = 0//
    var curr = array[0]
    for i in 0..<array.count {
        curr = array[i]
        if prev > 0 {
            curr +=  prev
        }
        ans = max(ans, curr)
        prev = curr
    }
    
    return ans
}

func subArrayMaxSub2(_ array: [Int]) -> Int {
    var innerArray = array
    //最优解法：动态规划 easy
    var ans = array[0]
    for i in 1..<array.count {
        innerArray[i] += max(innerArray[i-1],0)
        ans = max(ans,innerArray[i])
    }
    
    return ans
}
