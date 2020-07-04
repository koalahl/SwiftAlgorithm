//
//  344 Reverse String.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/7/3.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 344. 反转字符串
 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。

 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
 
 https://leetcode-cn.com/problems/reverse-string/
 
 */

func reverseString(_ s: inout [Character]) {
    reverseString2(&s)
}

//解法一，用个栈 时间复杂度 O（n），空间复杂度O（n）
func reverseString1(_ s: inout [Character]) {
    var stack = Stack<Character>()
    for c in s {
        stack.push(ele: c)
    }
    for (i,_) in s.enumerated() {
        let c = stack.pop()
        s[i] = c!
    }
    
}
//解法二，用个temp 时间复杂度 O（n）， 空间复杂度O（1）
func reverseString2(_ s: inout [Character]) {
    var temp:Character = Character("a")
    
    var i = 0 , j = s.count - 1
    while i < j {
        temp = s[j]
        s[j] = s[i]
        s[i] = temp
        i += 1
        j -= 1
    }
}
