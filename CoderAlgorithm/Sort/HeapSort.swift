
//
//  HeapSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/4/1.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

/// 堆排序
/// 时间复杂度 O(NlogN)
/// 空间复杂度 O(1)
/// - Parameter array: 原数组
func heapSort1<T:Comparable>(array: inout [T]) {
    var maxHeap = MaxHeap<T>(sort: >)
    //把数组中的每个元素放入堆中
    for i in array {
        maxHeap.insert(element: i)
    }
    //依次pop出堆顶元素，赋给原数组
    for k in (0...(array.count-1)).reversed() {
        array[k] = maxHeap.extract()!
    }
    
}

func heapSort2<T:Comparable>(array: inout [T]) {
    var maxHeap = MaxHeap<T>(sort: >)
    maxHeap.heapify(array: &array)
    
    //依次pop出堆顶元素，赋给原数组
    for k in (0...(array.count-1)).reversed() {
        array[k] = maxHeap.extract()!
    }
}


///原地堆排序，
/// 把数组看成一个堆，不断的进行heapify成最大堆
func heapSortInplace<T:Comparable>(array : inout [T]) {
    //heapify
    let lastFullNodeIndex = (array.count - 1) / 2
    for i in (0...lastFullNodeIndex).reversed() {
        shiftDown(&array,count:array.count,index:i)
    }
    //交换每个新的数组首尾元素，然后进行heapify。注意此时shiftDown的while条件是小于i次
    for i in (0...array.count-1).reversed() {
        array.swapAt(0, i)
        shiftDown(&array, count:i ,index: 0)
    }
}

private func shiftDown<T:Comparable>(_ array:inout [T] ,count n:Int , index:Int) {
    var k = index
    while 2*k+1 < n {
        var j = 2*k + 1//左子节点
        if (j + 1 < n && array[j+1] > array[j]) {
            j += 1
        }
        if (array[k] > array[j]){
            break
        }
        array.swapAt(k, j)
        k = j
    }
}
