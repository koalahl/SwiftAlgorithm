//
//  146 LRUCache.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/6/26.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**
 146. LRU缓存机制 https://leetcode-cn.com/problems/lru-cache/
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。


 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？
 
 解法：哈希表+双向链表
 我们用一个哈希表和一个双向链表维护所有在缓存中的键值对。

 - 双向链表按照被使用的顺序存储了这些键值对，靠近头部的键值对是最近使用的，而靠近尾部的键值对是最久未使用的。

 - 哈希表即为普通的哈希映射（HashMap），通过缓存数据的键映射到其在双向链表中的位置。

 这样以来，我们首先使用哈希表进行定位，找出缓存项在双向链表中的位置，随后将其移动到双向链表的头部，即可在 O(1)O(1) 的时间内完成 get 或者 put 操作。

 进阶：增加缓存删除策略
 三个维度：
 1 时间 age：比如清除时间大于30天的缓存
 2 容量 cost：比如清除缓存，直到整个缓存容量小于500MB
 3 数量 count：比如清除缓存，直到缓存数小于100条
 */

//先定义双向链表节点
fileprivate class LRUCacheDLinkNode {
    let key: Int
    var val: Int
    
    var pre: LRUCacheDLinkNode?
    var next: LRUCacheDLinkNode?
    
    init(_ key:Int, _ val:Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    var count: Int = 0     //当前链表节点数量
    var capacity: Int = 0  //链表容量（最大数量）
    //定义双向链表
    fileprivate var head = LRUCacheDLinkNode(0, 0)
    fileprivate var tail = LRUCacheDLinkNode(0, 0)
    fileprivate var dict = [Int:LRUCacheDLinkNode]()//定义哈希表结构
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveToHead(node: node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            //已经存在key对应的node，则更新值，并移动到链表头
            node.val = value
            moveToHead(node: node)
        }else {
            //不存在则创建新节点，
            let node = LRUCacheDLinkNode(key,value)
            //插入到双向链表头部
            insert(node: node)
            //判断容量是否超出，如果超出
            if count > capacity {
                //则移除链表尾部节点
                remove(node: tail.pre!)
            }
        }
    }
    
    //MARK: 清除策略
    //1 时间 age：比如清除时间大于30天的缓存
    func removeCacheBeforTime() -> Bool {
        return true
    }
    // 2 容量 cost：比如清除缓存，直到整个缓存容量小于500MB
    func removeCacheLessThanVolume(_ volume:Float) -> Bool {
        return true
    }
    // 3 数量 count：比如清除缓存，直到缓存数小于100条
    func removeCacheLessThanCapacity(_ capacity:Int) -> Bool {
        return true
    }
    

    //移动已存在的节点到头部,先删除原有的，再插入
    private func moveToHead(node:LRUCacheDLinkNode) {
        remove(node: node)
        insert(node:node)
    }
    //插入新的节点到头部
    private func insert(node:LRUCacheDLinkNode) {
        //存储到哈希表中
        dict[node.key] = node
        
        node.next = head.next
        head.next?.pre = node
        head.next = node
        node.pre = head
        
        count += 1
    }
    //删除某个节点
    private func remove(node:LRUCacheDLinkNode) {
        //移除哈希表中的key
        if let value = dict.removeValue(forKey: node.key) {
            print("The value \(value) was removed.")
        }
        
        //重置前后节点指向
        node.pre?.next = node.next
        node.next?.pre = node.pre
        //被删节点前后置空
        node.next = nil
        node.pre  = nil

        count -= 1
    }
    
}


extension LRUCache:CustomStringConvertible {
    public var description: String {
        return "链表：" + String(describing: head) +  "\n哈希表：" + String(describing: dict)
    }
    
}

extension LRUCacheDLinkNode:CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(val)" }
        return "\(val) -> " + String(describing: next)  + ""
    }
}














