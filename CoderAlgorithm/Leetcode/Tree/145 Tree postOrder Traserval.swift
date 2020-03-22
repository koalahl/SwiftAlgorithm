//
//  145 postOrder Traserval Tree.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/22.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
145 后序遍历
 [1,2,3,4,5,6,7]
output : [4,5,2,6,7,3,1]
 */
@discardableResult
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    postorderTraversal(root.left)
    postorderTraversal(root.right)
    arr.append(root.val)
    return arr
}

func posterorderTraversalIteration(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
//    前序遍历的过程 是 中左右。
//    将其转化成 中右左。也就是压栈的过程中优先压入左子树，在压入右子树。
//    然后将这个结果返回来，这里是利用栈的先进后出倒序打印。
    
    stack.push(ele: root)
    //
    var stack2 = Stack<TreeNode>()

    while !stack.isEmpty() {
        guard let node = stack.pop() else {
            break
        }
        //
        stack2.push(ele: node)
        
        if let left = node.left {
            stack.push(ele: left)
        }
        if let right = node.right {
            stack.push(ele: right)
        }
    }
    while !stack2.isEmpty() {
        if let node = stack2.pop() {
            arr.append(node.val)
        }
    }
    return arr
    
    //用来接收从stack1中pop出的结点
//    var stack2 = Stack<TreeNode>()
//    stack.push(ele: root)
//    while !stack.isEmpty() {
//        guard let node = stack.pop() else {
//            continue
//        }
//        //
//        stack2.push(ele: node)
//        print(node.val)
//
//        if node.left != nil {
//            stack.push(ele: node.left!)
//        }
//        if node.right != nil{
//            stack.push(ele: node.right!)
//        }
//    }
//    while !stack2.isEmpty() {
//        if let node = stack2.pop() {
//            arr.append(node.val)
//        }
//    }
//    return arr
}
