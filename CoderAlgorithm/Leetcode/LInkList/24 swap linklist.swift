//
//  24 swap linklist.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/5/20.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/// 两辆交换
/// https://leetcode-cn.com/problems/swap-nodes-in-pairs/
///  example：1-2-3-4    2-1-4-3
/// - Parameter head: 链表头节点
func swapPairs(_ head: ListNode<Int>?) -> ListNode<Int>? {
    
    if head == nil || head?.next == nil{
        return head
    }
    var prev:ListNode<Int>? = nil
    var curr = head
    var next = curr?.next

    let dummy = next
    //2-1-3-4
    while next !== nil {
       
        //先保存后面的节点：3
        let temp = next?.next
        //切断 2和3
        next?.next = curr
        curr?.next = temp
        //连接前后两对
        prev?.next = next
        //保存
        prev = curr
        //重新赋值到下一对
        curr = temp
        next = temp?.next
        
    }

    return dummy
}
