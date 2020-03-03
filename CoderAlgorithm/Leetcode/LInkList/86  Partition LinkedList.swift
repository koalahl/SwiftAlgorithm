//
//  86  Partition LinkedList.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/3.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 86. 分隔链表
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

 示例:

 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5
 解法：把大于等于x的结点移动到链表尾。
 时间复杂度：O（n），空间复杂度O（1）
 */
func partition(_ head: ListNode<Int>?, _ x: Int) -> ListNode<Int>? {
    if head == nil {
        return nil
    }
    let dummy = ListNode(0)
    dummy.next = head
    var prev = dummy
    var curr = head
    var third = head?.next
    var previous = prev//一直跟随curr遍历的前向结点，注意与prev的区别，prev不一定改变，而previous确定在curr之前
    //找到链表尾结点
    var tail = head
    while tail?.next !== nil {
        tail = tail?.next
    }
    var tempTail = tail//保存一下
    //开始遍历链表，直到遍历完原链表的所有元素；遍历条件：previous !== tail
    //并且curr不在链表尾。因为如果curr在链表尾部，说明curr之前的元素都是执行else分支的，已经遍历完整个链表了。即链表所有元素都是小于x的。
    while previous !== tail && curr?.next !== nil {//
        third = curr!.next
        //如果当前结点值比x大，则删除该结点，并把该结点放到链表尾
        if curr!.val >= x {
            let temp = curr//保存当前结点
            prev.next = curr?.next//连接当前结点前后结点指针指向，即切断当前结点
            tempTail?.next = temp//把当前结点放到链表尾
            temp?.next = nil
            tempTail = temp//更新tail
        }else {
            prev = curr!
        }
        previous = curr!
        curr = third
    }
    return dummy.next
}
