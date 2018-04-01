
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
