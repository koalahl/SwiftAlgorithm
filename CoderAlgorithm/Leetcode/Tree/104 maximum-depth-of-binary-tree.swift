//
//  104 maximum-depth-of-binary-tree.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/23.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 104. 二叉树的最大深度
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。
 */
func maxDepth(_ root: TreeNode?) -> Int {
    //解法一 递归
    guard let root = root else {
        return 0
    }
    
    let depthL = maxDepth(root.left)
    let depthR = maxDepth(root.right)
    return max(depthL, depthR) + 1
    
}
/// 解法二：迭代，使用一个栈来模拟递归时的系统栈。解法有点类似前序遍历
func maxDepthIteration(_ root :TreeNode?) -> Int {
    guard let root = root  else {
        return 0
    }
    var stack3 = Stack<(TreeNode?,Int)>()
    var depth = 0
    
    stack3.push(ele: (root,depth))
    
    while !stack3.isEmpty() {
        let (node,currDepth) = stack3.pop()!
        if let node = node {
            depth = max(depth,currDepth + 1)
            
            stack3.push(ele: (node.left,currDepth + 1))
            stack3.push(ele: (node.right,currDepth + 1))
        }
    }
    
    return depth
}
