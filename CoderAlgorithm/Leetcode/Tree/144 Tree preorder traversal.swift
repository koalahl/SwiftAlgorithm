//
//  144 Tree preorder traversal.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/22.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**144. 二叉树的前序遍历
 
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 有两种通用的遍历树的策略：

 深度优先搜索（DFS）

 在这个策略中，我们采用深度作为优先级，以便从跟开始一直到达某个确定的叶子，然后再返回根到达另一个分支。

 深度优先搜索策略又可以根据根节点、左孩子和右孩子的相对顺序被细分为前序遍历，中序遍历和后序遍历。

 宽度优先搜索（BFS）

 我们按照高度顺序一层一层的访问整棵树，高层次的节点将会比低层次的节点先被访问到。
 */
var arr = [Int]()
@discardableResult
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    //[1,2,3,4,5,6]
    //output:[1,2,4,5,3,6,7]
    guard let root = root else {
        return []
    }
    arr.append(root.val)
    preorderTraversal(root.left)
    preorderTraversal(root.right)
    return arr
}

//迭代解法：使用stack模拟系统栈
var stack = Stack<TreeNode>()
func preorderTraversalIteration(_ root: TreeNode?) -> [Int] {
    
    guard let root = root else {
        return []
    }
    //
    stack.push(ele: root)
    
    while !stack.isEmpty() {
        guard let node = stack.pop() else {
            break
        }
        
        arr.append(node.val)
        
        if let right = node.right {
            stack.push(ele: right)
        }
        if let left = node.left {
            stack.push(ele: left)
        }
    }

    return arr
}
