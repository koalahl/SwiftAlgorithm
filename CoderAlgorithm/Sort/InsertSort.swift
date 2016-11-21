//
//  InsertSort.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/25.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation
public  func insertSort( array:[Int]) -> [Int] {
    
    var a = array
    for i in 1..<a.count {
        var x = i
        while x > 0 && a[x] < a[x-1]{
            swap(&a[x], &a[x-1])
            x -= 1
        }
    }
    
    return a
}

public func insertSort2(array:[Int]) -> [Int]{
    
    var a = array
    
    for i  in 1..<a.count {
        var x = i
        let temp = a[x]
        while x > 0 && temp<a[x-1] {
            a[x] = a[x-1]
            x -= 1
        }
        a[x] = temp
    }
    
    return a
}

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
