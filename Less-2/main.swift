//
//  main.swift
//  Less-2
//
//  Created by Shamil Aglarov on 31.03.2022.
//

import Foundation

///1. Написать функцию, которая определяет, четное число или нет.
func isEven(_ number: Int) -> Bool {
    return number % 2 == 0 ? true : false
}
var inputNumber = 5
isEven(inputNumber) ? print("Число \(inputNumber) является четным") :
                      print("Число \(inputNumber) является нечетным")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isDividingANumberTree(_ number: Int) -> Void {
    if number % 3 == 0 {
        print("Число \(number) делится без остатка на 3")
    } else {
        print("Число \(number) не делится без остатка на 3")
    }
}
isDividingANumberTree(inputNumber)

//3. Создать возрастающий массив из 100 чисел.

var arrayOfHundredNumbers = [Int]()
for item in 1...100 {
    arrayOfHundredNumbers.append(item)
}
print(arrayOfHundredNumbers)
print("-------------------------------------------------------------------------------")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var xNumber: Int = 0
for item in arrayOfHundredNumbers {
    if item % 2 == 0 || item % 3 != 0 {
       arrayOfHundredNumbers.remove(at: xNumber)
    } else {
        xNumber += 1
    }
}
print("Из массива выше, были удалены все четные числа и числа которые не делятся на 3 т.е")
print("Представлены все нечетные числа которые могут делиться на 3 без остатка:\n\n \(arrayOfHundredNumbers)")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func fibonachchi() {
    var ziro = 0
    var one = 1
    var sum = 0
    var nextNewFibonachchi = ""
    ///0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
    while nextNewFibonachchi != "0" {
    print("Чтобы добавить новое число Фибоначчи, нажмите Enter -> ")
    print("Для выхода нажмите цифру 0")
        nextNewFibonachchi = readLine() ?? ""
        sum = one + ziro
        one = ziro
        ziro = sum
        print("\(sum) ")
    }
}
fibonachchi()

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., toNumber).
//b. Пусть переменная startValue изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем startValue, и присвоить значению переменной startValue это число.
//e. Повторять шаги c и d, пока возможно.

///Функция primeNumbers выводит на экран простые числа, до заданного числа toNumberX

func isPrime(_ number: Int) -> Bool {
return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
func primeNumbers(toNumber: Int) {
    let startValue: Int = 2
    let primeNumb = [Int](startValue...toNumber)
    
    for item in primeNumb {
        if isPrime(item) {
            print(item)
        }
    }
}
print("-------------------------------------")
print("Натуральные числа методом Эратосфена")
primeNumbers(toNumber: 100)
