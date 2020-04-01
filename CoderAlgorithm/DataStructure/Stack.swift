//
//  Stack.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/24.
//  Copyright © 2016年 HanLiu. All rights reserved.
//
/*
 A stack is like an array but with limited functionality. You can only push to add a new element to the top of the stack, pop to remove the element from the top, and peek at the top element without popping it off.
 
 Why would you want to do this? Well, in many algorithms you want to add objects to a temporary list at some point and then pull them off this list again at a later time. Often the order in which you add and remove these objects matters.
 
 A stack gives you a LIFO or last-in first-out order. The element you pushed last is the first one to come off with the next pop. (A very similar data structure, the queue, is FIFO or first-in first-out.)
 */
import Foundation

public struct Stack <T>{
    
    private var array = [T]()
    
    public func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    public var count:Int{
        return array.count
    }
    public mutating func push(ele:T) -> Void {
        array.append(ele)
    }
    public mutating func pop() -> T? {
        if array.isEmpty {
            return nil
        }
        return array.removeLast()
    }
    public mutating func peek() -> T? {
        return array.last
    }
}

/*
 Notice that a push puts the new element at the end of the array, not the beginning. Inserting at the beginning of an array is expensive, an O(n) operation, because it requires all existing array elements to be shifted in memory. Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.
 
 Fun fact about stacks: Each time you call a function or a method, the CPU places the return address on a stack. When the function ends, the CPU uses that return address to jump back to the caller. That's why if you call too many functions -- for example in a recursive function that never ends -- you get a so-called "stack overflow" as the CPU stack has run out of space.
 */

/**
 频率栈
 频率栈 push正常push pop需要pop频率出现最大的数字
 */
public class FreqStack {
    private var arr = [Int]()
    private var dic = [Int:Int]()
    
    public func push(_ item: Int) {
        //入栈时比较元素，如果已经出现过，则增加count值，不加入数组
        if var count = dic[item] {
            count += 1
            dic[item] = count
        }else {
            dic[item] = 1
            arr.append(item)
        }
        //找出最大count，满足条件则交换栈顶元素
        //比较新加入元素的count和当前栈顶元素的count
        let peek = arr.last!
        if dic[item]! > dic[peek]! {
            let i = self.arr.index(of: item)!
            let j = self.arr.index(of: peek)!
            (arr[i],arr[j]) = (arr[j],arr[i])
            
        }
    }
    
    public func pop () -> Int{
        return arr.removeLast()
    }
}

/** LeetCode 895 最大频率栈
 hard
 https://leetcode-cn.com/problems/maximum-frequency-stack/
 题解：
 https://leetcode-cn.com/problems/maximum-frequency-stack/solution/java-by-yu-bin-5-2/
 
*/
public class FreqStack2 {
    private var arr = [Int]()
    private var dic = [Int:Int]()
    
    public func push(_ item: Int) {
        //入栈时比较元素，如果已经出现过，则增加count值，不加入数组
        if var count = dic[item] {
            count += 1
            dic[item] = count
        }else {
            dic[item] = 1
            arr.append(item)
        }
        //找出最大count，满足条件则交换栈顶元素
        //比较新加入元素的count和当前栈顶元素的count
        let peek = arr.last!
        if dic[item]! > dic[peek]! {
            let i = self.arr.index(of: item)!
            let j = self.arr.index(of: peek)!
            (arr[i],arr[j]) = (arr[j],arr[i])
            
        }
    }
    
    public func pop () -> Int{
        return arr.removeLast()
    }
}


/**
 java 版
 
 class FreqStack {
     ArrayList<Stack<Integer>> freqs;
     HashMap<Integer, Integer> item_freq;
 
     public FreqStack() {
      freqs = new ArrayList();
      item_freq = new HashMap();
     }
     
     public void push(int x) {
         if(item_freq.get(x) == null){
             item_freq.put(x, 1);
         }else{
             item_freq.put(x, item_freq.get(x) + 1);
         }

         if(freqs.size() < item_freq.get(x)){
             Stack<Integer> s = new Stack<>();
             s.push(x);
             freqs.add(s);
         }else{
             freqs.get(item_freq.get(x) - 1).push(x);
         }
     }
     
     public int pop() {
         if(freqs.size() == 0){
             return -1;
         }
         Stack<Integer> innerStack = freqs.get(freqs.size() - 1);
          int numToPop = innerStack.pop();
          if(innerStack.size() == 0){
              freqs.remove(freqs.size() - 1);
          }
          item_freq.put(numToPop, item_freq.get(numToPop) - 1);

          return numToPop;
     }
 }

 作者：yu-bin-5
 链接：https://leetcode-cn.com/problems/maximum-frequency-stack/solution/java-by-yu-bin-5-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 
 
 */
