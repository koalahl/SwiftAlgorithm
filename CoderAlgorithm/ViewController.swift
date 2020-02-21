//
//  ViewController.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/11.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var problems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        /*
        var stack = Stack<Int>()
        stack.push(2)
        stack.push(244)
        print(stack,stack.peek())
        print(stack.pop())
        
        var queue = Queue<String>()
        print(queue.count)
        queue.enqueue("hello")
        queue.enqueue("rayderwich")
        queue.enqueue("algorithm")
        print(queue)
         */
        
        leetcodeSolutions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  problems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = problems[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController {
    func leetcodeSolutions() {
        //leetcode
        //1.two sum
        LeetCode1TwoSum()
        
        //2. Add Two Number , linkedList
        LeetCode2AddTwoNumber()
        
        //206 反转链表
        leetcode206ReverseLinkedList()
        
        //3. 最长无重复字符的子串
        //leetCode3()
        
        //88. 合并两个有序数组
        leetCode88()
    }
    
    func LeetCode1TwoSum() {
        let title = "LeetCode-1 Two Sum"
        print(title)
        problems.append(title)
        let nums = [0,2,4,6,8,10,12,14,16,18,20,22,24]
        let target = 20
        let result = twoSum(nums,target)
//        let result = twoSumTwo(nums,target)
        print("Output: indexes are" + "\(result as Any) \n")
    }
    
    func LeetCode2AddTwoNumber() {
        let title = "LeetCode-2 Add Two Number"
        print(title)
        problems.append(title)
        let (l1,l2) = creatLinkedList()
        let l3 = addTwoNumbers(l1.head!, l2.head!)
        print("output linkedList:"+"\(l3!) \n")
        
//        printLinkedListReversed(l1)
        
    }
    
    func leetcode206ReverseLinkedList() {
        let title = "LeetCode-206 ReverseLinkedList"
        print(title)
        problems.append(title)
        let (l1,_) = creatLinkedList()
        let list = reverseList(l1.head!)
        print("output linkedList:"+"\(list!) \n")

    }
    
    func leetCode3() {
        let title = "LeetCode-3 Find longest Substring without repeat characte"
        print(title)
        problems.append(title)
        let s = "pwwkew"
        let length = lengthOfLongestSubstring(s)
        print(length)
    }
    
    func leetCode88() {
        problems.append("LeetCode-88 Merge Two Sorted Array")
        var nums1 = [1,2,3,0,0,0];//[1,2,5,6,8,9]
        let nums2 = [2,5,6];//[3,4,6,7,10]
        mergeTwoSortedArray3(&nums1, 3, nums2, nums2.count)
        print(nums1)
        
//        mergeTwoSortedArrayUsingQuickSort(&nums1, nums1.count, nums2, nums2.count)
//        print(nums1)
    }
}


extension ViewController {
    
    /// 排序算法
    func sortAlgorithm() {
       var xxArray = [12, 43, 5, 7, 21, 3, 17,8]
        //var xxArray = generateRandomArray(n: 100, left: 1, right: 100)

//        let result2 = bucketSort(input: xxArray,maxValue: 50)
//        print(result2)
//
//        let numbers = selectionSort(array: xxArray)
//
//        /*--------InsertSort-------*/
//
//        let arr1 = insertSort2(array:xxArray)
//
//
//        let arr2 = insertSort(numbers) { (x, y) -> Bool in
//            return x > y
//        }
//        print(arr2)
//
//        let arr3 = insertSort(numbers) { $0<$1 }
//        print(arr3)
//
//        ---- merge sort ----
//        let startTime = CFAbsoluteTimeGetCurrent()
//        let arr2 = mergeSort(array: xxArray)
//
//        let finishTime = CFAbsoluteTimeGetCurrent()
//        print("mergeSort Time =",finishTime - startTime)


//
//        let index = binarySearch(bbsss, SearchKey: 59, Range: 0..<bbsss.count)
//        print(index)
        
//        ---- quick sort -----
//        let result = quickSort(bbsss)
//        print(result)
//        let result = quickSort(array: xxArray)
//        print(result)

//        let startTime1 = CFAbsoluteTimeGetCurrent()
//        let result = quickSort(array: xxArray)
//        let finishTime1 = CFAbsoluteTimeGetCurrent()
//        print("quickSort Time =",finishTime1 - startTime1)
//        print(result)
//
        let startTime2 = CFAbsoluteTimeGetCurrent()
        quickSortLomuto(array: &xxArray, low: 0, high: xxArray.count-1)
        print(xxArray)
        let finishTime2 = CFAbsoluteTimeGetCurrent()
        print("quickSortLomuto Time =",finishTime2 - startTime2)

//        let result1 = bubbleSort(array: xxArray)
//        print(result1)
        
//        let kthElement =  findKthElement(in: &xxArray, k: 30)
//        print("寻找N个元素中第K大个数：",kthElement)

        //------堆/堆排序-------//
//        var maxheap = MaxHeap<Int>(sort:>)//最大堆
//        var minheap = MaxHeap<Int>(sort:<)//最小堆
//        for i in 0..<31 {
//            maxheap.insert(element: Int(arc4random_uniform(100))+i)
//        }
//
//        print(maxheap)
//
//        maxheap.extract()
//
//        print(maxheap)
        
//        let startTime1 = CFAbsoluteTimeGetCurrent()
//        heapSort1(array: &xxArray)
//        let finishTime1 = CFAbsoluteTimeGetCurrent()
//        print("heapSort1 Time =",finishTime1 - startTime1)
        //print(xxArray)

//        var mxheap = MaxHeap<Int>(sort: >)
//        mxheap.heapify(array: &xxArray)
//        print(xxArray)
        
//        var xxArray2 = [Int]()
//        for i in xxArray {
//            xxArray2.append(i)
//        }
//
//        let startTime2 = CFAbsoluteTimeGetCurrent()
//        heapSort2(array: &xxArray2)
//        let finishTime2 = CFAbsoluteTimeGetCurrent()
//        print("heapSort2 Time =",finishTime2 - startTime2)
//        //print(xxArray2)

//        let startTime3 = CFAbsoluteTimeGetCurrent()
//        heapSortInplace(array: &xxArray)
//        let finishTime3 = CFAbsoluteTimeGetCurrent()
//        print("heapSort3 Time =",finishTime3 - startTime3)
//        print(xxArray)
        
//        let str = "abcdefghabcdefghij"
//        print(str.count)
//        let c = find1stDiffCharacter(instring: str)
//        print(c)
                
    }
    
    func generateRandomArray(n:Int,left:Int,right:Int) -> [Int] {
        var a = [Int](repeating:0, count:n)
        //生成n个介于left和right之间的元素
        for i in 0..<n {
            a[i] = Int(arc4random_uniform(UInt32(right))) % (right-left-1) + left
        }
        return a
    }
}
