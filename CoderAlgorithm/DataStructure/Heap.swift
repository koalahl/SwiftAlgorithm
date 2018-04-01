//
//  Heap.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/3/28.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

/// 普通堆：一颗完全二叉树，swift构建时，从0开始标记索引，视频上是从1开始。
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
        //将堆末尾的元素赋给根节点
        list[0] = list.removeLast()
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
    public mutating func extract() -> T?{
        guard !list.isEmpty else {
            return nil
        }
        //如果当前堆中只有一个元素了，就直接返回了
        if list.count == 1 {
            return list[0]
        }
        //主要过程：
        let item = list[0]
        //将堆末尾的元素赋给根节点
        list[0] = list.removeLast()
        //向下更新堆
        shiftDown(0)

        return item
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
    fileprivate mutating func shiftDown (_ index:Int){
        var i = index, k = index
        //满足条件：当前位置需要有子节点
        while leftChildNodeIndex(i) < self.count{
            var maxChileNode = list[leftChildNodeIndex(i)]
            //如果有右子节点，则比较左右子节点的大小，再赋值给maxChildNode
            if rightChildNodeIndex(i) < self.count {
                maxChileNode = max(list[leftChildNodeIndex(i)], list[rightChildNodeIndex(i)])
            }
            //Bug:当存在相当值的node时，数组的indexOf方法会返回首个索引。
            //k = list.index(of: maxChileNode)!
            
            k = maxChileNode == list[leftChildNodeIndex(i)] ? leftChildNodeIndex(i):rightChildNodeIndex(i)
            if self.orderCriteria( maxChileNode,list[i]) {
                list.swapAt(i, k)
            }
            //交换完之后将子节点的位置赋给i，然后再从i索引继续
            i = k
        }
    }
//MARK: Heapify 堆化一个数组
    /// 堆化
    /// 将一个数组转换成一个堆
    /// - Parameter array: 数组
    public mutating func heapify(array:inout [T]) {
        list = array
        //NOTE: 对于一个完全二叉树来说，第一个非叶子节点的位置是 （count - 1）/2 ,注意本项目的堆的索引从0开始，如果是从1开始，则是 count/2.
        let lastFullNodeIndex = (array.count - 1) / 2
        for i in (0...lastFullNodeIndex).reversed() {
            shiftDown(i)
        }
        array = list
    }
}

