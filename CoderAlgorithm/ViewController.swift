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
        
        let xxArray = [12, 43, 5, 7, 21, 3, 17,8, 23, 29, 31, 47, 41, 43, 10, 28, 22, 16, 15]


        /*--------InsertSort-------*/
//        var bbsss = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

//        let numbers = [7,2,90,44,21,8]
//        let arr = insertSort(numbers)
//        print(arr)
//        
//        let arr1 = insertSort2(numbers)
//        print(arr1)
//        
//        let arr2 = insertSort(numbers) { (x, y) -> Bool in
//            return x > y
//        }
//        print(arr2)
//        
//        let arr3 = insertSort(numbers) { $0<$1 }
//        print(arr3)
//        
//
//        let index = binarySearch(bbsss, SearchKey: 59, Range: 0..<bbsss.count)
//        print(index)
//        
//        let result = quickSort(bbsss)
//        print(result)
        
//        let result = quickSort(array: xxArray)
//        print(result)
//        quickSortLomuto(&xxArray, low: 0, high: xxArray.count-1)
//        print(xxArray)
        
        let result1 = bubbleSort(array: xxArray)
        print(result1)
        /*
        //1.two sum
        let nums = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100]
        let target = 200
        let result = Two_Sum().twoSum(nums,target)
        print(result)
        
      
        */
        
//        let result2 = bucketSort(input: xxArray,maxValue: 50)
//        print(result2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

