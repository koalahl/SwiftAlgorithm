//
//  94 Inorder Traserval Tree.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/22.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
94 中序遍历
 [1,2,3,4,5,6,7]
output : [4,2,5,1,6,3,7]
 */
@discardableResult
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    inorderTraversal(root.left)
    arr.append(root.val)
    inorderTraversal(root.right)
    return arr
}

func inorderTraversalIteration(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    var curr = root
    while !stack.isEmpty() || curr != nil {
        //一直遍历到最深的左子结点
        while curr != nil {
            stack.push(ele: curr)
            if let left = curr.left {
                curr = left
            }
        }
        //开始输出结点
        guard let node = stack.pop() else {
            break
        }
        arr.append(node.val)//print
        //如果输出到结点有右子树，则将curr转移到右子结点上
        if let right = node.right {
            curr = right
        }
    }
    
    return arr
    
    /*
     var currRoot = root
     while !stack.isEmpty() || currRoot != nil {
         //一直找到最底层的左子树
         while currRoot != nil {
             stack.push(ele: currRoot.left!)
             currRoot = currRoot.left!
         }
         //
         let node = stack.pop()!
         arr.append(node.val)
         //如果此时node是子树的父节点，则currRoot设置为右结点，下一步就可以加入到stack中
         if node.right != nil {
             currRoot = node.right!
         }
     }
     return arr
     */
}
