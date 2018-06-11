//
//  FindFirstDiffChar.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/4/3.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation

// 找到字符串中第一个非重复字符
// 时间复杂度：最差 O(n2)  最好：O(n)
public func find1stDiffCharacter(instring:String) -> Character {
    var str = instring
    var count = -1
    for index in str.indices {
        count += 1
        if (str[index] == "0") {
            continue
        }
        for j in str.indices.reversed() {
            count += 1
            //如果j此位置元素已经置为0了，则前移一位
            if (str[j] == "0") {
                continue
            }
            
            //找到
            if (index==j) {
                print(count)
                return str[index]
            }
            if (str[index] == str[j] && index != j) {
                str.update("0", at: index)
                str.update("0", at: j)
                break
            }
        }
    }
    return Character("0")
}
// 采用hash方式
func hash(str:String) -> Int {
    
    return 9999191919
}

/// 找出这个字符串中重复次数最多的那个字符
extension String {
    mutating func update(_ newElement:Character, at index:String.Index) {
        insert(newElement, at: index)
        remove(at: self.index(index, offsetBy: 1))
    }
}
