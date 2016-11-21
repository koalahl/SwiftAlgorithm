//
//  QuickSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/6/3.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
/*
 第一种快速排序方式：运用swift自身语法特点
 */
func quickSort<T:Comparable>( array:[T]) -> [T] {
    
    if array.count <= 1 {
        return array
    }else{
    
        let pivot   = array[array.count/2]
        let less    = array.filter{ $0 < pivot}
        let equal   = array.filter{ $0 == pivot}
        let greater = array.filter{ $0 > pivot}
        
        return quickSort(array: less) + equal + quickSort(array: greater)
    }
}
/*
 第二种快速排序方式：经典方法
 */
func partitionLomuto<T:Comparable>( array:inout [T],low:Int,high:Int) -> Int {
    let pivot = array[high]
    
    var i = low
    for j  in low..<high {
        if array[j] <= pivot {
            (array[i],array[j]) = (array[j],array[i])
            i += 1
        }
    }
    (array[i],array[high]) = (array[high],array[i])
    return i
}

func quickSortLomuto<T:Comparable>( array:inout [T],low:Int,high:Int) -> Void {
    if low < high {
        let p = partitionLomuto(array: &array, low: low, high: high)
        quickSortLomuto(array: &array, low: low, high: p-1)
        quickSortLomuto(array: &array, low: p+1, high: high)
    }
}
