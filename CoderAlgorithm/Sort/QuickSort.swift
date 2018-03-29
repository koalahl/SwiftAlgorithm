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
 
 快速排序
 时间复杂度：最优：O(NlogN),最差：O(N^2)
 空间复杂度：最优：O(logN), 最差：O(N)
 参考：https://blog.csdn.net/weshjiness/article/details/8660583
 */
func partitionLomuto<T:Comparable>( array:inout [T],low:Int,high:Int) -> Int {
    let pivot = array[high]
    
    var i = low
    for j  in low..<high {
        if array[j] >= pivot {
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

/*
 N个数中寻找第K大的元素
 1. 使用快速排序
 核心思想：快速排序每次分组之后返回的i值（分隔索引）也是该元素在整个数组排序完成之后的位置，不会改变。所以我们只要在相应区间范围内查找，可以减少查找时间，而不用等整个数组排完序。
 */
func quickSortKth<T:Comparable>( array:inout [T],low:Int,high:Int,k:Int) -> Void {
    if low < high {
        let p = partitionLomuto(array: &array, low: low, high: high)
        if p > k {
            quickSortKth(array: &array, low: low, high: p-1,k:k)
        }else if p < k{
            quickSortKth(array: &array, low: p+1, high: high,k:k)
        }
        else if p == k {return}

    }
    return
}
func findKthElement<T:Comparable>(in array:inout [T],k:Int) -> T {
    guard k < array.count else {
        return 65535 as! T
    }
    quickSortKth(array: &array, low: 0, high: array.count-1, k: k)
    return array[k-1]
}
