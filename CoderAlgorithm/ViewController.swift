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
        sortAlgorithm()
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
//MARK: LeetCode题解
extension ViewController {
    func leetcodeSolutions() {
        //leetcode
    //MARK: 数组
        //1.two sum
        LeetCode1TwoSum()
        //88. 合并两个有序数组
        leetCode88()
        //11. 盛水最多的容器
        leetCode11()
        //3. 最长无重复字符的子串
        leetCode3()
        
        findMiddleNum()
        
        getMinLength()
        //42
        trapRainWater()
        
    //MARK:  链表
        //2. Add Two Number , linkedList
        LeetCode2AddTwoNumber()
        //206 反转链表
        leetcode206ReverseLinkedList()
        //92 反转链表II
        leetcode206ReverseLinkedList()
        //234 判断一个单链表是否回文链表
        leetcode234()
        //203 移除链表元素 1
        leetcode203()
        //83 删除有序链表中的重复元素，只保留第一个
        leetcode83()
        //82 删除有序链表的全部重复元素
        leetcode82()
        //19 删除链表中倒数第n个结点
        leetcode19()
        //21 合并两个有序链表
         leetcode21()
        //61 旋转链表
        leetcode61()
        //141 判断链表是否有环
        leetCode141()
        //142 判断链表是否有环，并返回环起始结点
        leetCode142()
        //143 重排链表
        leetCode143()
        //86  分隔链表
        leetCode86()
        //160 相交链表
        leetCode160()
    }

}
//MARK: 数组
extension ViewController {
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
    
    func leetCode88() {
        let title = "LeetCode-88 Merge Two Sorted Array"
        print(title)
        problems.append(title)
        var nums1 = [1,2,3,0,0,0];//[1,2,5,6,8,9]
        let nums2 = [2,5,6];//[3,4,6,7,10]
        mergeTwoSortedArray3(&nums1, 3, nums2, nums2.count)
        print("output:\(nums1)\n")
//        mergeTwoSortedArrayUsingQuickSort(&nums1, nums1.count, nums2, nums2.count)
//        print(nums1)
    }
    
    func leetCode11() {
        let title = "LeetCode-11 Container with most water"
        print(title)
        problems.append(title)
        let nums1 = [1,4,5,6,8,9,6]
        let result = maxArea2(nums1)
        print("output:\(result) \n")
    }
    
    func findMiddleNum() {
        let title = "findMiddleNum"
        print(title)
        let nums1 = [3,2,5,8,9,6,11]//[1,4,5,6,8,9,6]
        let result = findNum2(nums1)
        print("output:\(result) \n")

    }
    
    func getMinLength() {
        
        let title = "getMinLengthSubArray"
        print(title)
        let nums1 = [3,4,7,5,11,8,9,10]//[5,8,9,6,11]//[1,4,5,6,8,9,6]
        let result = getMinLengthSubArray(nums1)
        print("output:\(result) \n")

    }
    
    func trapRainWater() {
        
        let title = "trapRainWater"
        print(title)
        let nums1 = [0,1,0,2,1,0,1,3,2,1,2,1]
        let result = trap(nums1)
        print("output:\(result) \n")
    }
}
//MARK: String
extension ViewController {
    func leetCode3() {
        let title = "LeetCode-3 Find longest Substring without repeat characte"
        print(title)
        problems.append(title)
        let s = "pwwkew"
        let length = lengthOfLongestSubstring(s)
        print(length)
    }
}

//MARK: Linked List
extension ViewController {
    func LeetCode2AddTwoNumber() {
        let title = "LeetCode-2 Add Two Number"
        print(title)
        problems.append(title)
        let (l1,l2) = creatLinkedList()
        let l3 = addTwoNumbers(l1.head!, l2.head!)
        print("output linkedList:"+"\(l3!) \n")
    }
    
    func leetcode206ReverseLinkedList() {
        let title = "LeetCode-206 ReverseLinkedList"
        print(title)
        problems.append(title)
        let (_,l2) = creatLinkedList()
        let list = reverseList(l2.head!)
        print("output linkedList:"+"\(list!) \n")

    }
    func leetcode92() {
        let title = "LeetCode-92 ReverseLinkedList II"
        print(title)
        problems.append(title)
        let (_,l2) = creatLinkedList()
        let list = reverseBetween(l2.head, 2, 4)
        print("output linkedList:"+"\(list!) \n")

    }
    func leetcode234() {
            let title = "LeetCode-234 is LinkList Palindrome"
            print(title)
            problems.append(title)
            let l1 = createLinkList(with: [1,2,3,2,1])
            let result = isPalindrome(l1?.head)
            print("output:\(result) \n")
    }
        
    func leetcode203() {
        let title = "LeetCode-203 Remove LinkList Element"
        print(title)
        problems.append(title)
        let (l1,_) = creatLinkedList()
        let result = removeLinkListElements(l1.head,1)
        print("output:\(result) \n")
    }
    
    func leetcode83() {
        let title = "LeetCode-83 Remove Duplicates From sorted list"
        print(title)
        problems.append(title)
        let (l1,_) = creatLinkedList()
//        let result = deleteDuplicates(l1.head)
        let result = removeDuplicateNodes(l1.head)
        print("output:\(result) \n")

    }
    
    func leetcode82() {
        let title = "LeetCode-82 Remove Duplicates From sorted list II"
        print(title)
        problems.append(title)
        let (l1,_) = creatLinkedList()
        let result = deleteDuplicatesAll(l1.head)
        print("output:\(result) \n")

    }
    
    func leetcode19() {
        let title = "LeetCode-19 Remove Nth node from the end of list "
        print(title)
        problems.append(title)
        let (l1,_) = creatLinkedList()
        let result = removeNthFromEnd(l1.head, 2)
        print("output:\(result) \n")
    }

    func leetcode21() {
        let title = "LeetCode-21 Merge Two Sorted LinkList "
        print(title)
        problems.append(title)
        let (l1,l2) = creatLinkedList()
        let result = mergeTwoLists(l1.head,l2.head)
        print("output:\(result) \n")
    }
    
    func leetcode61() {
        let title = "LeetCode-61 Rotate list "
        print(title)
        problems.append(title)
        let (l1,_) = creatLinkedList()
        let result = rotateListRight(l1.head, 2)
        print("output:\(String(describing: result)) \n")
    }
    
    func leetCode143() {
        let title = "LeetCode-143 Reorder list "
        print(title)
        problems.append(title)
        let list = createLinkList(with: [1,2,3,4])
        let _ = reorderList(list?.head)
        print("output:\(list) \n")
    }
    
    func leetCode141() {
        let title = "LeetCode-141 LinkList Cycle "
        print(title)
        problems.append(title)
        let list = createCycleLinkList(with: [3,2,0,-4], pos:1)
        let result = hasCycle(list?.head)
        print("output:\(result) \n")
    }
    
    func leetCode142() {
        let title = "LeetCode-142 LinkList Cycle II "
        print(title)
        problems.append(title)
        let list = createCycleLinkList(with: [3,2,0,-4], pos:1)
        let cyclenode = detectCycle2(list?.head, 1)//这个pos入参没用
        print("output:\(String(describing: cyclenode?.val)) \n")
    }
    
    func leetCode86() {
        let title = "LeetCode-86 Partition LinkList "
        print(title)
        problems.append(title)
        let list = createLinkList(with: [1,2,3])
        let result = partition(list?.head, 5)
        print("output:\(String(describing: result)) \n")
    }
    
    func leetCode160() {
        let title = "LeetCode-160 Intersection of two linkedlist "
        print(title)
        problems.append(title)
            //创建两个链表节点
            let n1 = ListNode(6)
            let n2 = ListNode(4)
            let n3 = ListNode(3)

//            n1.next = n2
//            n2.next = n3
            
            let n4 = ListNode(5)
            let n5 = ListNode(6)
            let n6 = ListNode(4)
            let n7 = ListNode(7)

            n4.next = n1
//            n5.next = n2
//            n6.next = n2

        let result = getIntersectionNode(n1, n4)
        print("output:\(String(describing: result)) \n")
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

extension ViewController {

}
