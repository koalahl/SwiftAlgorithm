//
//  BinarySearchTree.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2018/4/19.
//  Copyright © 2018 HanLiu. All rights reserved.
//

import Foundation
/*
 二分搜索树（二叉搜索树）
 特点：每个节点的值大于左子节点，小于右子节点。
      每个节点的子树仍为一个二分搜索树。
      二分搜索树不一定是一个完全二叉树。
 */
class BinaryTreeNode <T:Comparable>{
    var value:T
    
    var left:BinaryTreeNode<T>?
    var right:BinaryTreeNode<T>?
    
    public var children = [BinaryTreeNode<T>]()
    public weak var parent: BinaryTreeNode?

    var count:Int {
        return (left?.count ?? 0) + (right?.count ?? 0) + 1//左子树的count加右子树的count+根节点
    }
    
    init(value:T) {
        self.value = value
    }
    
    public func addChild(_ node: BinaryTreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}
//树结点
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(value:Int) {
        self.val = value
        self.left = nil
        self.right = nil
    }
    //返回树的结点个数
    public var count:Int {
        return left?.count ?? 0 + (right?.count ?? 0) + 1
    }
}
