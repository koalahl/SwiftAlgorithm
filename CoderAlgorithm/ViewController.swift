//
//  ViewController.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/11.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
//        var xxArray = [12, 43, 5, 7, 21, 3, 17,8]
        var xxArray = generateRandomArray(n: 10000, left: 1, right: 10000)
        
        
        
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
//        let startTime2 = CFAbsoluteTimeGetCurrent()
//
        
//        quickSortLomuto(array: &xxArray, low: 0, high: xxArray.count-1)
//        print(xxArray)
//        let finishTime2 = CFAbsoluteTimeGetCurrent()
//        print("quickSortLomuto Time =",finishTime2 - startTime2)

//        let result1 = bubbleSort(array: xxArray)
//        print(result1)
        
//        let kthElement =  findKthElement(in: &xxArray, k: 30)
//        print("寻找N个元素中第K大个数：",kthElement)

        
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
        
        let startTime1 = CFAbsoluteTimeGetCurrent()
        heapSort1(array: &xxArray)
        let finishTime1 = CFAbsoluteTimeGetCurrent()
        print("heapSort1 Time =",finishTime1 - startTime1)
        //print(xxArray)

//        var mxheap = MaxHeap<Int>(sort: >)
//        mxheap.heapify(array: &xxArray)
//        print(xxArray)
        
        var xxArray2 = [Int]()
        for i in xxArray {
            xxArray2.append(i)
        }
        
        let startTime2 = CFAbsoluteTimeGetCurrent()
        heapSort2(array: &xxArray2)
        let finishTime2 = CFAbsoluteTimeGetCurrent()
        print("heapSort2 Time =",finishTime2 - startTime2)
        //print(xxArray2)

        
        //leetcode

        /*
         //1.two sum
         let nums = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]
         let target = 200
         let result = Two_Sum().twoSum(nums,target)
         print(result)
         
         
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

