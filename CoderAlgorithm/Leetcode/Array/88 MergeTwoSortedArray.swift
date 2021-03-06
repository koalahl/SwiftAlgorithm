//
//  File.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/4/24.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

/// LeetCode88 合并两个有序数组
/// - https://leetcode-cn.com/problems/merge-sorted-array/?utm_source=LCUS&utm_medium=ip_redirect_q_uns&utm_campaign=transfer2china
/// - 笨办法：时间复杂度 O(n*m),空间复杂度O(n+m)
public func mergeTwoSortedArray(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var k = 0
    var arr = [Int]()
    
    for j in 0..<n {
        for i in k..<m {
            if nums1[i] == 0 {
                arr.append(nums2[j])
                k += 1
                break
            }
            if nums2[j] > nums1[i] {

                arr.append(nums1[i])
                k += 1
                //处理nums2最后一个值没有被加入arr中的问题
                if k == m {
                    arr.append(nums2[j])
                    break
                }
            }else if nums2[j] < nums1[i]{
                arr.append(nums2[j])
                break
            }else {
                arr.append(nums1[i])
                arr.append(nums2[j])
                k += 1
                break
            }
        }
    }
    nums1 = arr
}

public func mergeTwoSortedArray2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // 解法1
    var i = m - 1
    var j = n - 1
    var k = m + n - 1
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            k -= 1
            i -= 1
        } else {
            nums1[k] = nums2[j]
            k -= 1
            j -= 1
        }
    }
    while j >= 0 {
        nums1[k] = nums2[j]
        k -= 1
        j -= 1
    }
}

public func mergeTwoSortedArray3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // 解法2 这个更屌
    var i = m - 1, j = n - 1
    
    while i >= 0 || j >= 0 {
        if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
            nums1[i + j + 1] = nums1[i]
            i -= 1
        } else {
            nums1[i + j + 1] = nums2[j]
            j -= 1
        }
    }
}


public func mergeTwoSortedArrayUsingQuickSort(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    //先把两个数组相加
    nums1 = nums1 + nums2
    //在用快速排序
    quickSortLomuto(array: &nums1, low: 0, high: nums1.count-1)
    
}

/// 预先不补位
//[1,2,5,6,8,9]
//[2,5,6]
//[2,5,5,6,6,8,9]
//从小到大排      while + ans.insert(nums1[i], at: 0) 是n^2的时间复杂度
//从大到小来

public func mergeTwoSortedArray4(_ nums1: inout [Int], _ nums2: [Int]) -> [Int]{
    var ans = [Int]()
    var i = nums1.count - 1
    var j = nums2.count - 1
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            ans.insert(nums1[i], at: 0)
            i -= 1
        }else {
            ans.insert(nums2[j], at: 0)
            j -= 1
        }
    }
    let rest = i > 0 ? nums1[0...i] : nums2[0...j]
    var restIndex = i > 0 ?i : j
    while restIndex >= 0 {
        ans.insert(rest[restIndex], at: 0)
        restIndex -= 1
    }
    return ans
}

public func mergeTwoSortedArray5(_ nums1: inout [Int], _ nums2: [Int]) -> [Int]{
    var ans = [Int]()
    var i = nums1.count - 1
    var j = nums2.count - 1
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            ans.append((nums1[i]))
            i -= 1
        }else {
            ans.append((nums2[j]))
            j -= 1
        }
    }
    let rest = i > 0 ? nums1[0...i] : nums2[0...j]
    var restIndex = i > 0 ?i : j
    while restIndex >= 0 {
        ans.append(rest[restIndex])
        restIndex -= 1
    }
    return ans.reversed()
}
