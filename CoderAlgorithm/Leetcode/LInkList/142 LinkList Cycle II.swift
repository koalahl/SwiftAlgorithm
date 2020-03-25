//
//  142 LinkList Cycle II.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/27.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 142. 环形链表 II
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

 说明：不允许修改给定的链表。

 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：tail connects to node index 1
 解释：链表中有一个环，其尾部连接到第二个节点。
 */
var set = Set<Int>()
func detectCycle(_ head: ListNode<Int>?, _ pos: Int) -> ListNode<Int>? {
    if head == nil || head?.next == nil {
        return nil
    }
    var node = head
    //创建一个集合set，把访问过的元素放入集合中，如果再次访问到这个元素，说明这个元素就是环的起点。
    //时间复杂度：O(n), 空间复杂度O(n)
    while node != nil {
        if set.contains(node!.val) {
            return node
        }
        set.insert(node!.val)
        node = node!.next
    }
    return nil
}

//解法二：Floyd 算法
//时间复杂度：O(n), 空间复杂度O(1)
func detectCycle2(_ head: ListNode<Int>?, _ pos: Int) -> ListNode<Int>? {
    if head == nil || head?.next == nil {
        return nil
    }
    //先找到相遇结点
    let meetnode = meetNodeInCycleLinkList(head)
    
    //第二步：让两个指针一起出发，直到相等，此时相等的结点就是环的起始点
    var pt1 = head
    var pt2 = meetnode
    //两种while写法：
    while pt1 != nil && pt2 != nil {
        if pt1 === pt2 {
            return pt1
        }
        pt1 = pt1?.next
        pt2 = pt2?.next
    }
    return nil
    
//    if meetnode === nil {
//        return nil
//    }
//    while pt1 !== pt2 {
//        pt1 = pt1?.next
//        pt2 = pt2?.next
//    }
//    return pt1
}

private func meetNodeInCycleLinkList(_ head:ListNode<Int>?) -> ListNode<Int>? {

    if head == nil || head?.next == nil {
        return nil
    }
    var slow = head
    //注意这里一个重要的区别：141判断链表有环里面的快结点是在第二个结点位置。而这里是在头结点上。
    //这是一个非常重要的区别！！！
    //也就是说这是两种判断链表是否有环的写法。141是一前一后，142是起点相同。不管怎么样，终究会追上。都会找到一个相遇结点
    //而142这里 寻找相遇结点 必须用这种方式，否则第二步就无法工作。
    var fast = head
    while fast !== nil && fast?.next !== nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return slow
        }
    }
    return nil
}
