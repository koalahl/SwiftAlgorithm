//
//  1Two Sum.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/11.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import UIKit
/*
 let nums = [3,5,10,4]
 let target = 14
 */
class Two_Sum: NSObject {
    func twoSum(nums:[Int],_ target:Int) -> [Int]? {
        var result = [Int]()
        
        for item in nums {
            if nums.index(of: item) == nums.count - 1 {
                break
            }
            let nextItem  = nums[nums.index(of: item)! + 1]
            if (item + nextItem) == target {
                result.append(nums.index(of: item)!)
                result.append(nums.index(of: nextItem)!)
            }
        }
        if result.count > 0 {
            return result
        }
        return []
    }
}
