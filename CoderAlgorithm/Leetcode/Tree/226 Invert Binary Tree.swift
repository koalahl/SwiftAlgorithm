//
//  226 Invert Binary Tree.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/22.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**
 226. 翻转二叉树
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1       3    6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9       6    3   1
 备注:
 这个问题是受到 Max Howell 的 原问题 启发的 ：

 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。
 */
@discardableResult
func invertTree(_ root: TreeNode?) -> TreeNode? {
    
    guard let root = root else {
        return nil
    }
    //交换两个子结点
    (root.left,root.right) = (root.right,root.left)
    invertTree(root.left)
    invertTree(root.right)
    
    return root
}

func invertTree2(_ root:TreeNode?) ->TreeNode? {
    guard let root = root else { return nil }
    
    var queue = Queue<TreeNode>()
    queue.enqueue(element: root)
    
    while !queue.isEmpty {
        //弹出一个节点
        let curr = queue.dequeue()
        //swap
        let temp = curr?.left
        curr?.left = curr?.right
        curr?.right = temp
        //再入队
        if let left = curr?.left {
            queue.enqueue(element: left)
        }
        if let right = curr?.right {
            queue.enqueue(element: right)
        }
    }
    
    return root
}

func invertTree3(_ root:TreeNode?) ->TreeNode? {
    guard let root = root else { return nil }
    
    var array = Array<TreeNode>()
    array.append(root)
    
    while !array.isEmpty {
        //弹出一个节点
        let curr = array.removeLast()
        //swap
        let temp = curr.left
        curr.left = curr.right
        curr.right = temp
        //再入队
        if let left = curr.left {
            array.append(left)
        }
        if let right = curr.right {
            array.append(right)
        }
    }
    
    return root
}
