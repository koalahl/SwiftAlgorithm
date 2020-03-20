//
//  QuickSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/6/3.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
/*
 优化的排序算法 [参见维基百科](https://zh.wikipedia.org/wiki/%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F)
 快速排序是二叉查找树（二叉搜索树）的一个空间最优化版本。不是循序地把数据项插入到一个明确的树中，而是由快速排序组织这些数据项到一个由递归调用所隐含的树中。这两个算法完全地产生相同的比较次数，但是顺序不同。对于排序算法的稳定性指标，原地分区版本的快速排序算法是不稳定的。其他变种是可以通过牺牲性能和空间来维护稳定性的。
 
 快速排序的最直接竞争者是堆排序（Heapsort）。堆排序通常比快速排序稍微慢，但是最坏情况的运行时间总是 {\displaystyle O(n\log n)} {\displaystyle O(n\log n)}。快速排序是经常比较快，除了introsort变化版本外，仍然有最坏情况性能的机会。如果事先知道堆排序将会是需要使用的，那么直接地使用堆排序比等待introsort再切换到它还要快。堆排序也拥有重要的特点，仅使用固定额外的空间（堆排序是原地排序），而即使是最佳的快速排序变化版本也需要 {\displaystyle \Theta (\log n)} {\displaystyle \Theta (\log n)}的空间。然而，堆排序需要有效率的随机存取才能变成可行。
 
 快速排序也与归并排序（Mergesort）竞争，这是另外一种递归排序算法，但有坏情况 {\displaystyle O(n\log n)} {\displaystyle O(n\log n)}运行时间的优势。不像快速排序或堆排序，归并排序是一个稳定排序，且可以轻易地被采用在链表（linked list）和存储在慢速访问媒体上像是磁盘存储或网络连接存储的非常巨大数列。尽管快速排序可以被重新改写使用在链串列上，但是它通常会因为无法随机存取而导致差的基准选择。归并排序的主要缺点，是在最佳情况下需要 {\displaystyle \Omega (n)} {\displaystyle \Omega (n)}额外的空间。
 */

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
fileprivate func partitionLomuto<T:Comparable>( array:inout [T],low:Int,high:Int) -> Int {
    let pivot = array[high]

    var i = low
    for j  in low..<high {
        if array[j] >= pivot { //1️⃣条件：从大到小排序，即较大的数往前挪
            (array[i],array[j]) = (array[j],array[i])
            i += 1
        }
    }
    //遍历完之后，i位置左侧都是小于基准数的，右侧都是大于基准数的。所以i就是这次基准数的最终位置，把基准数和i位置的元素交换一下，
    (array[i],array[high]) = (array[high],array[i])
    return i
}
//[5,7,3,8,9,4]
public func quickSortLomuto<T:Comparable>( array:inout [T],low:Int,high:Int) -> Void {
    if low < high {
        let p = partitionLomuto(array: &array, low: low, high: high)
        quickSortLomuto(array: &array, low: low, high: p-1)//注意这里high的值是p-1，因为p位置上的值是上一次patition的pivot基准数，已经做过比较了。同理下面一行
        quickSortLomuto(array: &array, low: p+1, high: high)
    }
}

/*
 N个数中寻找第K大的元素
 1. 使用快速排序
 核心思想：快速排序每次分组之后返回的i值（分隔索引）也是该元素在整个数组排序完成之后的位置，不会改变。所以我们只要在相应区间范围内查找，可以减少查找时间，而不用等整个数组排完序。
 */
fileprivate func quickSortKth<T:Comparable>( array:inout [T],low:Int,high:Int,k:Int) -> Void {
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
public func findKthElement<T:Comparable>(in array:inout [T],k:Int) -> T {
    guard k < array.count else {
        return 65535 as! T
    }
    quickSortKth(array: &array, low: 0, high: array.count-1, k: k)
    return array[k-1]
}
