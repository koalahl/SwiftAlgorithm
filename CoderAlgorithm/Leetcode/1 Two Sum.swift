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
 Link: https://leetcode-cn.com/problems/two-sum/
 
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 变体： 在n个元素的数组中，找到差值为k的数字对去重后的个数
 */

/*
 解法1：暴力枚举
 时间复杂度 O(n^2)
 */
func twoSumOne(_ nums:[Int], _ target: Int) -> [Int] {
    for (i,_) in nums.enumerated() {
        for (j,_) in nums.enumerated() {
            if nums[i] + nums[j] == target  {
                return [i,j]
            }
        }
    }
    fatalError("NotFound")
}

/*
 解法2： 利用map 存放
 但是数组中有可能出现重复元素，这样就不能正确找到对应元素的下标。例如[3,3] target = 6时。
 dq 时间复杂度：O（2n）
 */
func twoSumTwo(_ nums:[Int],_ target:Int) -> [Int] {
    var dict = [Int:Int]()
    //先填充字典，
    for (i,num) in nums.enumerated() {
        dict[num] = i
    }
    //再找到
    for (i,num) in nums.enumerated() {
        if let index = dict[target-num] {
            return [index,i]
        }
    }
    fatalError("NotFound")
}

/*
 解法3： 利用map
 使用这种方法，我们就可以避免重复元素带来的问题。因为我们在判断是否有包含i元素的答案的时候，i还没有被加入map当中。
 dq 时间复杂度：O（n）
 */
func twoSum(_ nums:[Int],_ target:Int) -> [Int] {
    var dict = [Int:Int]()
    for (i,num) in nums.enumerated() {
        //重点：先不要加入dict中，如果字典中没有符合的num则加入dict
        if let index = dict[target-num] {
            return [index,i]
        }
        dict[num] = i
    }
    fatalError("NotFound")
}

