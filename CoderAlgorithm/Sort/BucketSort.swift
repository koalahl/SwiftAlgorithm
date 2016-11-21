//
//  BucketSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/7/13.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
//桶排序

func bucketSort(input:[Int],maxValue:Int) -> [Int] {
    var array = input
    //声明桶数组
    var buckets = [Int](repeating:0,count:maxValue)
    //为每个桶初始化
    for element in array {
        buckets[element] += 1
    }
    
    var k = 0
    for (index,_) in buckets.enumerated() {
        while buckets[index] > 0 {//这里一定要注意循环条件
            array[k] = index
            k += 1
            buckets[index] -= 1
        }
    }
    return array
    
}
