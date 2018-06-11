//
//  1Two Sum.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/11.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import UIKit
/*
 Leetcode: 1. 两数之和
 Link: https://leetcode-cn.com/problems/two-sum/description/
 
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
    
/*
 dq 时间复杂度：O（n）
 */
func twoSum(_ nums:[Int],_ target:Int) -> [Int] {
    var dict = [Int:Int]()
    for (i,num) in nums.enumerated() {
        if let index = dict[target-num] {
            return [index,i]
        }
        dict[num] = i
    }
    fatalError("NotFound")
}

