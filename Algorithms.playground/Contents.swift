import UIKit

// MARK: - Task 1
/// Условие:
/// На вход подается масив типа и объект типа Int. Верните индексы двух чисел из массива которые в сумме дают значение объекта.
///
/// Решение может быть только одно и элементы массива не повторяются, если пара не найдена, то верните пустой массив.

let array = [ 3, 7, 6, 8, 16, 5 ]
let target = 19

func getIndicesOfSums(array: [Int], target: Int) -> [Int] {
    var hashTable: [Int: Int] = [:]
    
    for (index, element) in array.enumerated() {
        if let differenceIndex = hashTable[target - element] {
            return [index, differenceIndex]
        }
        hashTable[element] = index
    }
    return []
}

getIndicesOfSums(array: array, target: target)
/// - Complexity: O(*n*), where *n* is the length of the sequence.


//  MARK: - Task 2
/// Условие:
/// Удалите дубликаты в отсортированном массиве, вернуть количество элементов в массиве

var sortArray = [ 0, 0, 1, 1, 3, 4, 4, 4, 5, 5, 8 ]
 ///inout - ссылка на массив, изменения будет происхоит именно в этом массиве, а не в копии
func removeDuplicates(array: inout [Int]) -> Int {
    var last: Int?
    var index: Int = 0
    while index < array.count {
        if array[index] == last {
            array.remove(at: index)
        } else {
            last = array[index]
            index += 1
        }
    }
    return array.count
}
removeDuplicates(array: &sortArray)
print(sortArray)
/// - Complexity: O(*n*), where *n* is the length of the sequence.

//  MARK: - Task 3
/// Условие:
/// Удалите дубликаты в не отсортированном массиве, вернуть количество элементов в массиве

var unsortArray = [ 1, 0, 9, 1, 0, 9, 3, 4, 5, 9, 3 ]

func removeDupl(array: inout [Int]) -> Int {
    var hashTable: [Int: Int] = [:]
    var index: Int = 0
    while index < array.count {
        if hashTable[array[index]] != nil {
            array.remove(at: index)
        } else {
            hashTable[array[index]] = index
            index += 1
        }
    }
    return array.count
}
removeDupl(array: &unsortArray)
print(unsortArray)
/// - Complexity: O(*n*), where *n* is the length of the sequence.

//  MARK: - Task 4
/// Условие:
/// Найти кратчайший несортированный, непрерывный подмассив в массиве
/// На вход подается массив, в этом массиве нужно найти такой подмассив, который если отсортируете в порядке возврастания, отсортирует весь массив в порядке возрастания

/// [1, 4, 3, 2, 6] ---> [4, 3, 2]
/// [6, 4, 10, 10, 4, 15] -----> [6, 4, 10, 10, 4]
/// [ 1, 1 ] ------> []

func findUnsortedSubarray(array: [Int]) -> Int {
    let lastIndex = array.count - 1
    var maxNum = array[0]
    var minNum = array[lastIndex]
    
    var endIndex = 0
    var startIndex = 1
    
    for (index, element) in array.enumerated() {
        maxNum = max(maxNum, element)
        if element < maxNum {
            endIndex = index
        }
        minNum = min(minNum, array[lastIndex - index])
        if array[lastIndex - index] > minNum {
            startIndex = lastIndex - index
        }
    }
    return endIndex - startIndex + 1
}

findUnsortedSubarray(array: [6, 4, 10, 10, 4, 15])
findUnsortedSubarray(array: [1, 1])
/// - Complexity: O(*n*), where *n* is the length of the sequence.
