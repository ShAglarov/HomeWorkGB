//
//  main.swift
//  5_HomeworkTasks
//
//  Created by Shamil Aglarov on 25.03.2022.
//

import Foundation

print("""
          Задача 1: Решить квадратное уравнение
          """)
let a: Double = 4
let b: Double = -16
let c: Double = 10
var x: Double = 0
print("\nРешение 1-й задачи\n")
if (b*b - 4*a*c)>=0 { //если дискриминант больше или равен 0
    x = (-1*b + sqrt(b*b - 4*a*c) ) / (2 * a)
    print("Первый корень равен: \(x)\n")
    x = (-1*b - sqrt(b*b - 4*a*c) ) / (2 * a)
    print("Второй корень равен: \(x)\n")
} else {
    print("Дискриминант меньше 0, корни невещественные.\n")
}
print("-------------------------------------------------")
print("""
          \nЗадача 2: Даны катеты прямоугольного треугольника.
          Найти площадь, периметр и гипотенузу треугольника\n
          """)
let firstK: Double = 5
let secondK: Double = 7

let hypotenuse = sqrt(a*a+b*b)
let area = a*b/2
print("Гипотенуза равна: \(hypotenuse)\nПлощадь равна: \(area)")

print("-------------------------------------------------")
print("""
          \nЗадача 3: Пользователь вводит сумму вклада в банк и
          годовой процент. Найти сумму вклада через 5 лет\n
          """)
func inputDepositInToBank(percentDeposit: Double, depositForYears: Double) -> Double {
    print("Введите сумму вклада")
    let inputDeposit = readLine() ?? "0"
    guard inputDeposit != "0" else {
        print("is nil")
        return 0
    }
    let sumDeposit = ((Double(inputDeposit)!*percentDeposit) / Double(100)) * Double(depositForYears)
    return sumDeposit
}
print(inputDepositInToBank(percentDeposit: 6.5, depositForYears: 5))

print("-------------------------------------------------")
print("""
          \nЗадача 4: Конвертер валют на языке Swift
          Программа хранит в двух переменных курс доллара и евро.
          В первой переменной у вас хранится стоимость одного евро
          в рублях, во второй - стоисмость одного доллара в рублях.
          Вы спрашиваете у пользователя, сколько рублей он хочет
          сконвертировать, получаете это число и считаете.
          Результат надо вывести на экран консоли
          """)
let euroExchange = 115.62
let dollarExchange = 105.81
print("введите цифру в консоль, сколько рублей вы хотите сконвертировать")
let inputRublesForConvert = Double(readLine()!)!
let convertDollar = inputRublesForConvert / dollarExchange
let convertEuro = inputRublesForConvert / euroExchange
print("\(inputRublesForConvert) рублей в долларах это - \(NSString(format:"%.2f",convertDollar)),\n\(inputRublesForConvert) рублей в евро это - \(NSString(format:"%.2f",(convertEuro)))")

print("-------------------------------------------------")
print("""
          \nЗадача 5: Подсчет площади трапеции.
          Пользователь вводит длину оснований трапеций (а и b),
          а также высоту страпеции h.
          Программа выводит сообщение: "Площадь трапеций будет равна "значение".
          Площадь вычисляется по формуле ((а + b)/2)*h, где a, b - основания,
          h - высота
          """)
print("Введите длинну трапеции Х")
let trapeziumLenghtX = Double(readLine()!)!
print("Введите длинну трапеции У")
let trapeziumLenghtY = Double(readLine()!)!
print("Введите высоту трапеции У")
let trapeziumHeightH = Double(readLine()!)!
print("Площадь трапеций равна: \(((trapeziumLenghtX + trapeziumLenghtY)/2)*trapeziumHeightH)")





