//
//  100 Is same Tree.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/3/21.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 100. 相同的树
 给定两个二叉树，编写一个函数来检验它们是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

 示例 1:

 输入:       1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 输出: true
 */
func isSameTree(_ p:TreeNode? , _ q :TreeNode?) -> Bool {
    /*思路：递归判断每个左右子结点
    时间复杂度 : O(N)O(N)，其中 N 是树的结点数，因为每个结点都访问一次。

    空间复杂度 : 最优情况（完全平衡二叉树）时为 O(\log(N))O(log(N))，最坏情况下（完全不平衡二叉树）时为 {O}(N)O(N)，用于维护递归栈。
    */
    guard let p = p else {
        return q == nil
    }
    guard let q = q else {
        return p == nil
    }
    
    if p.val != q.val {
        return false
    }
    
    return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}
