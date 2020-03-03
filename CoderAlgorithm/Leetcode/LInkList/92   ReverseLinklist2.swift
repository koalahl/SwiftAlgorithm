//
//  92ReverseLinklist2.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2019/12/15.
//  Copyright © 2019 HanLiu. All rights reserved.
//

import Foundation
/**
 反转链表2⃣️
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5-->NULL
 
 https://leetcode-cn.com/problems/reverse-linked-list-ii/

 - 解法一：递归  时间复杂度：O(n) 空间复杂度：O(n)
 - 解法二：多指针，一次扫描 ：时间复杂度：O(n) 空间复杂度：O(1)
 */
func reverseBetween(_ head: ListNode<Int>?, _ m: Int, _ n: Int) -> ListNode<Int>? {
    if head == nil {
        return nil
    }
    var mm = m
    var nn = n
    var curr = head
    var dummy = head
    var prev:ListNode<Int>? = nil
    //把curr移动到第m个结点位置。m和n在这一步的循环中已经减小了m-1，
    while m > 1 {
        prev = curr
        curr = curr?.next
        mm -= 1
        nn -= 1
    }
    
    let con = prev//保存第m个结点的前一个结点
    let tail = curr//保存到第m个结点位置
    var third:ListNode<Int>? = nil
    
    //此时循环的次数实际上就是第m到第n个结点之前到结点个数 ： n-m+1 个/次
    while nn > 0 {
        third = curr?.next//先用third保存curr后面的结点
        curr?.next = prev//往前指
        prev = curr
        curr = third
        nn -= 1
    }
    //prev就是第n个结点位置，curr就是第n个结点后面一个结点
    if con !== nil {
        con!.next = prev
    }else {
        dummy = prev
    }
    //
    tail?.next = curr
    return dummy
}


/// 递归
var stop = false
var left = ListNode(0)

func reverseBetween2(_ head: ListNode<Int>?, _ m: Int, _ n: Int) -> ListNode<Int>? {
    if head == nil {
        return nil
    }
    left = head!
    var dummy = head
    var mm = m
    var nn = n
    recurseAndReverse(&dummy, &mm, &nn)
    return head
}

func recurseAndReverse(_ right: inout ListNode<Int>?,_ m : inout Int, _ n: inout Int) {
    if n == 1 {
        return
    }
    
    
}
