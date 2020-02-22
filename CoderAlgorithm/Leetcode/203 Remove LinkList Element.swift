//
//  203 Remove LinkList Element.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/22.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/*
 203. 移除链表元素
 删除链表中等于给定值 val 的所有节点。

 示例:

 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-linked-list-elements
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/*解法：使用哨兵结点作为伪头结点
 时间复杂度：O（n），空间复杂度O（1）
 注意：哨兵节点广泛应用于树和链表中，如伪头、伪尾、标记等，它们是纯功能的，通常不保存任何数据，其主要目的是使链表标准化，如使链表永不为空、永不无头、简化插入和删除。
 */
func removeLinkListElements(_ head: ListNode<Int>?, _ val: Int) -> ListNode<Int>? {
    //伪结点dummy，注意虚拟结点在swift中不能设置为nil
    let dummy = ListNode(0)
    dummy.next = head
    var prev = dummy
    var curr = head
    //遍历链表
    while curr != nil {
        //比较
        if curr?.val == val {
            prev.next = curr?.next
        }else {
            prev = curr!
        }
        curr = curr?.next
    }
    return dummy.next
}
