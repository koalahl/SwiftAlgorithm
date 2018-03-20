//
//  MergeSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/3/17.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

/*
 归并排序
 时间复杂度 Nlog(N): log(N)表示划分的层级，N表示每一层最多遍历一次n个元素。
 
 算法思想：分治 ：从左到右依次遍历两个序列，每次取最小的。这种做法的前提就是需要保证每个序列都是已经排序的。
 
 算法特点：需要额外开辟O(N)的空间。
 */

func mergeSort<T:Comparable>(array:[T])  -> [T]{
    guard array.count > 1 else {
        return array
    }
    let mid = array.count/2
    
    let leftArray  = mergeSort(array: Array(array[0..<mid]))
    let rightArray = mergeSort(array: Array(array[mid..<array.count]))

    return merge(larr: leftArray, rarr: rightArray)
}


fileprivate func merge<T:Comparable>(larr:[T],rarr:[T]) -> [T]{
    
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray = [T]()
    
    while leftIndex < larr.count && rightIndex < rarr.count {
        if larr[leftIndex] < rarr[rightIndex] {
            orderedArray.append(larr[leftIndex])
            leftIndex += 1
        }else if larr[leftIndex] > rarr[rightIndex] {
            orderedArray.append(rarr[rightIndex])
            rightIndex += 1
        }else {
            orderedArray.append(larr[leftIndex])
            leftIndex += 1
            orderedArray.append(rarr[rightIndex])
            rightIndex += 1
        }
    }
    //经过上面的循环后， left Array 或者 right Array 肯定有一个会完全合并入 orderedArray 中。 所以就不用在进行比较了，直接把剩余的数组放入 orderedArray 中即可。
    while leftIndex < larr.count {
        orderedArray.append(larr[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rarr.count {
        orderedArray.append(rarr[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}
