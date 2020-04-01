//
//  42 trap rain water.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/27.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**
 42 接雨水
 [0,1,0,2,1,0,1,3,2,1,2,1]
 output: 6
 
 [1]
 output:0
 
 [1,0]
 output:0
 */
func trap(_ height: [Int]) -> Int {
//    trapUsingArray(height)
    trapByDoublePoint(height)
}

/// 使用数组保存当前元素左右两边的最大值
/// 时间复杂度：On，空间复杂度On
/// - Parameter height: 高度组
func trapUsingArray(_ height: [Int]) -> Int {
    let length = height.count
    //注意边界条件的判断
    if length == 0 || length == 1{
        return 0
    }
    
    
    //1 find max left
    var max_left = Array(repeating: 0, count: length)
    max_left[0] = height[0]
    for i in 1...length-1 {
        max_left[i] = max(height[i],max_left[i-1])
    }
    //2 find max right
    var max_right = Array(repeating: 0, count: length)
    max_right[length-1] = height[length-1]
    for (i,_) in height[0...length-2].enumerated().reversed() {
        max_right[i] = max(height[i],max_right[i+1])
    }

    var ans = 0
    for i in 1...length-1 {
        ans += min(max_left[i],max_right[i])-height[i]
    }
    
    return ans
}

/// 双指针
/// left right分别指向高度组左右两边，往中间遍历。
/// 时间复杂度：On，空间复杂度O1
/// - Parameter height: 高度组
func trapByDoublePoint(_ height : [Int]) -> Int {
    let length = height.count
    var left = 0, right = length - 1
    var ans = 0
    var max_left = 0,max_right = 0
    
    while left < right {
        if height[left] < height[right] {
            if height[left] > max_left {
                max_left = height[left]
            }else{
                ans += (max_left - height[left])
            }
            left += 1
        }else {
            if height[right] > max_right {
                max_right = height[right]
            }else {
                ans += (max_right - height[right])
            }
            right -= 1
        }
    }
    return ans
}
