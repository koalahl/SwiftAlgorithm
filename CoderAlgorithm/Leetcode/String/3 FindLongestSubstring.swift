//
//  3FindLongestSubstring.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/4/29.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

/*
 3. 无重复字符的最长子串
 
 给定一个字符串，找出不含有重复字符的最长子串的长度。
 
 示例：
 
 给定 "abcabcbb" ，没有重复字符的最长子串是 "abc" ，那么长度就是3。
 
 给定 "bbbbb" ，最长的子串就是 "b" ，长度是1。
 
 给定 "pwwkew" ，最长子串是 "wke" ，长度是3。请注意答案必须是一个子串，"pwke" 是 子序列  而不是子串。
 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    let sArray = Array(s)
    var left = 0, longest = 0,right = 0
    var dic:[Character:Int] = [:]
    
    for (index,char) in s.enumerated() {
        print(char, index)
        //1. 检查该字符是否已经存在于字典中，如果存在则更新point位置
        if let value = dic[char] {
            left = max(value + 1, left)
        }
        //2. 计算longest，取最大值
        longest = max(index - left + 1, longest)
        //3. 若字符不在字典中，则添加到字典中
        dic[char] = index
        right = index
    }
    //4. 最长子串范围：left--right
    print(sArray[left...right])//类型是 ArraySlice ：["v", "d", "f"]
    let subArray = sArray[left...right]
    print(String(subArray))//可以直接转为字符串
    
    return longest
}
