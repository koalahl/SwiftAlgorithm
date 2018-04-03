//
//  InsertSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/25.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
/*
 插入排序
 时间复杂度：O(n^2)
 
 算法核心：将i（i>0）前面的每一个元素依次与第i个元素作比较。    a:每次比较后满足循环条件都交换元素；
    b:直到比较后不满足循环条件时再交换元素。
 与选择排序的区别：插入排序可以提前结束的机会，理论上会比选择排序用时少一点。
 当一个数组近似有序时，插入排序的时间复杂度将趋于O(n)
 
 稳定排序
 */
public  func insertSort<T:Comparable>( array:[T]) -> [T] {
    
    var a = array
    let startTime = CFAbsoluteTimeGetCurrent()

    //注意起始位置是从第1个元素开始的，不需要考虑第0个元素
    for i in 1..<a.count {
        var x = i
        //判决条件
        while x > 0 && a[x] < a[x-1]{
            a.swapAt(x, x-1)
            x -= 1
        }
    }
    let finishTime = CFAbsoluteTimeGetCurrent()
    print("InsertSort Time =",finishTime - startTime)

    return a
}

///上面的经典插入排序耗时是非常高的，因为如果第i个元素比前面的元素都小（或者说满足条件）则每次比较后都会交换元素。我们知道swap函数是一个耗时操作，因为要操作指针（即内存）。
///改进后的插入排序：延迟交换元素的时机，做完所有比较后再赋值。
public func insertSort2<T:Comparable>(array:[T]) -> [T]{
    
    var a = array
    let startTime = CFAbsoluteTimeGetCurrent()

    for i  in 1..<a.count {
        //注意：必须要记录当前第i个元素的下标和值，一个i不够用
        var x = i
        let temp = a[x]
        //重点：真正退出while（不满足循环条件）时再交换赋值
        while x > 0 && temp<a[x-1] {
            a[x] = a[x-1]
            x -= 1
        }
        a[x] = temp
    }
    let finishTime = CFAbsoluteTimeGetCurrent()
    print("InsertSort2 Time =",finishTime - startTime)

    return a
}
/*
 插入排序的变体：把条件作为入参，用指针函数替代（即block）
 */
public  func insertSort<T>( array:[T],isOrderedBefore:(T,T)->Bool) -> [T] {
    
    var a = array
    for i in 1..<a.count {
        var x = i
        let temp = a[x]
        while x > 0 && isOrderedBefore(temp,a[x-1]) {
            a[x] = a[x-1]
            x -= 1
        }
        a[x] = temp
    }
    
    return a
}
