//
//  BinarySearch.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 16/5/26.
//  Copyright © 2016年 HanLiu. All rights reserved.
//

import Foundation


//Note that the array is sorted. The binary search algorithm does not work otherwise!!!!


public func binarySearch(array:[Int],SearchKey key:Int,Range range:Range<Int> ) ->Int?{

    if range.lowerBound >= range.upperBound {
        return nil
    }else{
        //注意middleIndex的计算方式
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
        if key < array[middleIndex] {
            return binarySearch(array: array, SearchKey: key, Range: range.lowerBound..<middleIndex)
        }else if key > array[middleIndex]{
            return binarySearch(array: array, SearchKey: key, Range: (middleIndex + 1 )..<range.upperBound)
        }else{
            return middleIndex
        }
        
    }

}
