//
//  160 Intersection of two linkedlist.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/25.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation


/// 编写一个程序，找到两个单链表相交的起始节点。
/// - Parameters:
///   - headA: 链表1
///   - headB: 链表2
func getIntersectionNode(_ headA: ListNode<Int>?, _ headB: ListNode<Int>?) -> ListNode<Int>? {
    if headA == nil || headB == nil {
        return nil
    }

    var curr1 = headA, curr2 = headB
    while curr1 !== curr2 {
        curr1 = curr1?.next
        curr2 = curr2?.next
        
        if curr1 === curr2 {
            return curr2
        }
        
        if curr1 == nil {
            curr1 = headB
        }
        if curr2 == nil {
            curr2 = headA
        }
    }
    return curr1
}
