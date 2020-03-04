//
//  11 Container with most water.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/4.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 11. 盛最多水的容器
 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。
 
 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 
 https://leetcode-cn.com/problems/container-with-most-water/

 示例:

 输入: [1,8,6,2,5,4,8,3,7]
 输出: 49
 */
func maxArea(_ height: [Int]) -> Int {
    return maxArea2(height)
}

///解法一：暴力解法，遍历每一种组合
///时间复杂度：O（n^2）空间复杂度：O（1）
func maxArea1(_ height:[Int]) -> Int {
    var maxarea = 0
    for (i,first) in height.enumerated() {
        for (j,second) in height.enumerated() {
            maxarea = max(maxarea, (j - i) * min(first, second) )
        }
    }
    return maxarea
}

/// 双指针：指向首尾，移动较短的
///时间复杂度：O（n）空间复杂度：O（1）
func maxArea2(_ height:[Int]) -> Int {
    var maxarea = 0
    var left  = 0
    var right = height.count - 1
    
    while left < right {
        //先更新当前的区域面积
        maxarea = max(maxarea,(right - left) * min(height[right],height[left]))
        if height[left] < height[right] {
            left += 1
        }else{
            right -= 1
        }
    }
    return maxarea
}
