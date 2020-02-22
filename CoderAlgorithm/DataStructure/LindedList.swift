//
//  ListNode.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2019/12/15.
//  Copyright © 2019 HanLiu. All rights reserved.
//

import Foundation
///链表节点
public class ListNode<T> {
    public var val: T
    public var next: ListNode?
    
    public init(_ val:T) {
        self.val  = val
        self.next = nil
    }
}

extension ListNode:CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(val)" }
        return "\(val) -> " + String(describing: next)  + ""
    }
}

///链表
public struct LinkedList<T> {
    public var head:ListNode<T>?
    public var tail:ListNode<T>?
    
    public var isEmpty:Bool {
        return head == nil
    }
    
    public init() {}
    //MARK: 增加元素的操作
    //1. push
    //2. append
    //3. insert(at:)
    
    ///在链表头部加入新元素
    public mutating func push(_ value:T) {
        let node = ListNode(value)
        node.next = head
        head = node
        if tail == nil {
            tail = head
        }
    }
    ///在链表尾部加入新元素
    public mutating func append(_ value:T) {
        //如果链表为空，则直接push
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = ListNode(value)
        tail = tail!.next
    }
    ///在链表中的某个元素之后插入新的value,返回插入的节点
    @discardableResult
    public mutating func insert(_ value: T, after node:ListNode<T>) -> ListNode<T>{
        //如果是在尾部插入，则直接append
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        let n = ListNode(value)
        n.next = node.next
        node.next = n

        return n
    }
    
    //MARK: 减少元素的操作
    //1. pop
    //2. removelast
    //3. remove(at:)
    
    ///删除链表最前端的节点
    @discardableResult
    public mutating func pop() ->ListNode<T>?{
        defer {
            head = head!.next
            if isEmpty {
                tail = nil
            }
        }
        return head
    }
    /// 删除链表最后一个节点,返回被删除的节点
    @discardableResult
    public mutating func removeLast() ->ListNode<T>?{
        //删除链表先考虑两种情况
        //1.如果链表为空时
        guard let head = head else { return nil }
        //2.如果链表只有一个节点时
        guard head.next != nil else { return pop() }
        
        //3.来两个哨兵，前后依次往前走，遍历链表。
        // prev  curr
        // 当curr.next == nil时，表示curr已经是链表最后一个节点了，即while退出.此时prev就是倒数第二个节点
        var prev = head
        var curr = head
        while let next = curr.next {
            prev = curr
            curr = next
        }
        
        prev.next = nil
        tail = prev
        
        return curr
    }
    
    ///删除链表中某个节点后面的节点
    @discardableResult
    public mutating func remove(after node:ListNode<T>) ->ListNode<T>?{
        if node.next == nil {
            tail = node
        }
        node.next = node.next?.next
        
        return node.next
    }
    
    ///返回第index位置上的节点
    public mutating func node(at index:Int) -> ListNode<T>?{
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
}

extension LinkedList:CustomStringConvertible {
    public var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
    
}

func creatLinkedList()  -> (LinkedList<Int>, LinkedList<Int>){
    //创建两个链表节点
    let n1 = ListNode(6)
    let n2 = ListNode(4)
    let n3 = ListNode(3)
    n1.next = n2
    n2.next = n3
//    print(n1)
    
    let n4 = ListNode(5)
    let n5 = ListNode(6)
    let n6 = ListNode(4)
    n4.next = n5
    n5.next = n6
//    print(n4)
    
    //创建两个链表
    var list1 = LinkedList<Int>()
    list1.push(1)
    list1.push(2)
    list1.push(3)
    list1.push(3)
    list1.push(2)
    list1.push(1)
    print(list1)
    var list2 = LinkedList<Int>()
    list2.push(3)
    list2.push(6)
    list2.push(2)
    print(list2)
    
    return (list1,list2)
}

/// 逆序打印链表
/// 递归。就是从最小问题出发
func printLinkedListReversed(_ list:LinkedList<Int>) {
    _printLinkedListReversed(list.head)
}

private func _printLinkedListReversed(_ node:ListNode<Int>?) {
    guard let node = node else { return }
    _printLinkedListReversed(node.next)
    print(node.val)
}
