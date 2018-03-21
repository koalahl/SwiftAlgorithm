//
//  Queue.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/24.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

/*
 A queue is a list where you can only insert new items at the back and remove items from the front. This ensures that the first item you enqueue is also the first item you dequeue. First come, first serve!
 
 Why would you need this? Well, in many algorithms you want to add objects to a temporary list at some point and then pull them off this list again at a later time. Often the order in which you add and remove these objects matters.
 
 A queue gives you a FIFO or first-in, first-out order. The element you inserted first is also the first one to come out again. It's only fair! (A very similar data structure, the stack, is LIFO or last-in first-out.)
 */

//https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue

import Foundation

public struct Queue <T> {
    private var list = [T?]()
    private var header = 0
    
    public var isEmpty:Bool{
        return list.isEmpty
    }
    
    public var count:Int{
        return list.count
    }
    public mutating func enqueue(element:T){
        
        list.append(element)
    }
    
    public mutating func dequeue() -> T?{
        
        guard header < list.count,let element = list[header] else{ return nil }
        
        list[header] = nil
        header += 1
        
        //当header前有多少个nil时，直接删除所有nil的空间
        let percentage = Double(header)/Double(list.count)
        if percentage > 0.25 && list.count > 50 {
            list.removeFirst(header)
        }
        return element
        
    }
    
    public func peek() ->T? {
        return list[header]
    }
    
}
