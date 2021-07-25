import UIKit

//Условие:
//На вход подается масив типа и объект типа Int. Верните индексы двух чисел из массива которые в сумме дают значение объекта.
//
//Решение может быть только одно и элементы массива не повторяются, если пара не найдена, то верните пустой массив.

let array = [ 3, 7, 6, 8, 16, 5 ]
let target = 15

func getIndicesOfSums(array: [Int], target: Int) -> [Int] {
    var numberIndices: [Int] = []
    var hashTable: [Int: Int] = [:]
    
    for (index, element) in array.enumerated() {
        hashTable[element] = index
        let difference = target - element
        if let differenceIndex = hashTable[difference] {
            numberIndices = [index, differenceIndex]
            break
        }
    }
    return numberIndices
}

getIndicesOfSums(array: array, target: target)
// Сложность O(n) где n - это количетсво элементов в массиве

