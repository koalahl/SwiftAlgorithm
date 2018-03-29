//
//  Heap.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/3/28.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

//普通堆：一颗完全二叉树，swift构建时，从0开始标记索引，视频上是从1开始。
struct Heap<T:Comparable> {
    private var list = [T?]()

    public func isEmpty() ->Bool{
        return list.isEmpty
    }
    
    func leftChildNode(index:Int) -> T? {
        return list[index*2+1]
    }
    func rightChildNode(index:Int) ->T? {
        return list[index*2+2]
    }
    
    func parentNode(index:Int) -> T? {
        return list[(index-1)/2]
    }
    //入堆：加入到list末尾
    public mutating func insert(element:T) {
        list.append(element)
    }
    //出堆：移除堆的首个元素
    public mutating func extract() {
        list.removeFirst()
    }
}
/// 最大堆
struct MaxHeap<T:Comparable> {
    private var list = [T]()
    private var orderCriteria : (T,T)->Bool
    
    var count :Int {
        return list.count
    }

    public func isEmpty() ->Bool{
        return list.isEmpty
    }
    
    init(sort:@escaping (T,T)->Bool) {
        self.orderCriteria = sort
    }
    fileprivate func leftChildNodeIndex(_ index:Int) -> Int {
        return index*2+1
    }
    fileprivate func rightChildNodeIndex(_ index:Int) ->Int {
        return index*2+2
    }
    
    fileprivate func parentNodeIndex(_ index:Int) -> Int {
        return (index-1)/2
    }

    //入堆：加入到list末尾
    public mutating func insert(element:T) {
        list.append(element)
        //把count位置的元素向上移动
        shiftUp(index: list.count - 1)
        
    }
    //出堆：移除堆的首个元素
    public mutating func extract() {
        guard !list.isEmpty else {
            return print("Heap is empty!")
        }
        //将堆末尾的元素赋给根节点
        list[0] = list.removeLast()
        //
        shiftDown()
    }
    
    //向上
    fileprivate mutating func shiftUp(index:Int){
        var i = index
        while i > 0 &&   self.orderCriteria(list[i],list[parentNodeIndex(i)]) {
            list.swapAt(i, parentNodeIndex(i))
            i = parentNodeIndex(i)
        }
    }
    //向下
    fileprivate mutating func shiftDown (){
        var i = 0
        var k = 0
        while leftChildNodeIndex(i) < self.count && rightChildNodeIndex(i) < self.count{
            let maxChileNode = max(list[leftChildNodeIndex(i)], list[rightChildNodeIndex(i)])
            k = list.index(of: maxChileNode)!
            if self.orderCriteria( maxChileNode,list[i]) {
                list.swapAt(i, k)
            }
            i = k
        }
        
        
    }

}

