//  main.swift
//  Created by Shamil Aglarov on 04.04.2022
//  HomeWord-3


//Урок 3. Комплексные типы данных
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct SportCar {
    /// модель автомобиля
    let model: String
    
    /// год выпуска автомобиля
    let yearOfCar: UInt
    
    /// вместительность багажа автомобиля в килограммах
    var volumeBaggage: UInt
    
    /// Запущен ли двигатель true - запущен / false - заглушен
    var isWasStartEnigine: Bool = false
    
    /// Открыты ли окна true - открыты / false - закрыты
    var isWasOpenOrCloseWindow: Bool = false
    
    /// Багаж заполнен или нет true - заполнен / false - не заполнен
    var isWasFilledBaggage: Bool = false
    
    /// Сколько килограмм загружаем/выгружаем из багажа
    var loadUnLoadOfBaggage: UInt = 0
    
    ///состояние багажа (на сколько заполнен)
    var filledBaggage: UInt = 0
 
    //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
    mutating func perform(an action: Action) {
        switch action {
        case .turnOntheEngine:
            isWasStartEnigine = true
        case .turnOffTheEngine:
            isWasStartEnigine = false
        case .openWindow:
            isWasOpenOrCloseWindow = true
        case .closeWindow:
            isWasOpenOrCloseWindow = false
        case .filling:
            // проверям состояние багажа
            if isWasFilledBaggage {
                print("Багаж полный, желаете разрузить багаж? y/n")
                let input = readLine()!
                if input == "y" {
                    //разгруаем car.perform(an: .turnOntheEngine) багаж
                    filledBaggage = 0
                    //изменяем состояние багажа false - не заполнен
                    isWasFilledBaggage = false
                    // используем рекурсию для возврата в начало метода
                    perform(an: action)
                } else if input == "n" {
                    // иначе идем дальше
                }
            }
            
            // проверяем есть ли еще место в багажнике
            if (filledBaggage + loadUnLoadOfBaggage) > volumeBaggage {
                print("Багаже нет столько места, вы можете вместить \((filledBaggage + loadUnLoadOfBaggage)-volumeBaggage) килограмм")
                print("Снизьте количество вещей загружаемых в багаж")
            } else {
                volumeBaggage -= loadUnLoadOfBaggage
            }
        case .unloading:
            volumeBaggage += loadUnLoadOfBaggage
        }
    }
}

struct TrunkCar {
    /// модель автомобиля
    let model: String
    
    /// год выпуска автомобиля
    let yearOfCar: UInt
    
    /// вместительность багажа автомобиля в килограммах
    var volumeBaggage: UInt
    
    /// Запущен ли двигатель true - запущен / false - заглушен
    var isWasStartEnigine: Bool = false
    
    /// Открыты ли окна true - открыты / false - закрыты
    var isWasOpenOrCloseWindow: Bool = false
    
    /// Багаж заполнен или нет true - заполнен / false - не заполнен
    var isWasFilledBaggage: Bool = false
    
    /// Сколько килограмм загружаем/выгружаем из багажа
    var loadUnLoadOfBaggage: UInt = 0
    
    ///состояние багажа (на сколько заполнен)
    var filledBaggage: UInt = 0
 
    //4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
    mutating func perform(an action: Action) {
        switch action {
        case .turnOntheEngine:
            isWasStartEnigine = true
        case .turnOffTheEngine:
            isWasStartEnigine = false
        case .openWindow:
            isWasOpenOrCloseWindow = true
        case .closeWindow:
            isWasOpenOrCloseWindow = false
        case .filling:
            // проверям состояние багажа
            if isWasFilledBaggage {
                print("Багаж полный, желаете разрузить багаж? y/n")
                let input = readLine()!
                if input == "y" {
                    //разгруаем багаж
                    filledBaggage = 0
                    //изменяем состояние багажа false - не заполнен
                    isWasFilledBaggage = false
                    // используем рекурсию для возврата в начало метода
                    perform(an: action)
                } else if input == "n" {
                    // иначе идем дальше
                }
            }
            
            // проверяем есть ли еще место в багажнике
            if (filledBaggage + loadUnLoadOfBaggage) > volumeBaggage {
                print("Багаже нет столько места, вы можете вместить \((filledBaggage + loadUnLoadOfBaggage)-volumeBaggage) килограмм")
                print("Снизьте количество вещей загружаемых в багаж")
            } else {
                volumeBaggage -= loadUnLoadOfBaggage
                filledBaggage += loadUnLoadOfBaggage
            }
        case .unloading:
            volumeBaggage += loadUnLoadOfBaggage
            filledBaggage -= loadUnLoadOfBaggage
        }
    }
}

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum Action {
    /// Запуск двигателя
    case turnOntheEngine
    
    /// Выключение двигателя
    case turnOffTheEngine
    
    /// Открыть окна
    case openWindow
    
    /// Закрыть окна
    case closeWindow
    
    /// Совершить погрузку груза в багаж
    case filling
    
    /// Совершить выгрузку груза из багажа
    case unloading
}

var car = SportCar(model: "Mersedes-Benz MAYBACH", yearOfCar: 2022, volumeBaggage: 100)
//Покупаем Майбах
print(car)
//заводим Майбах
car.perform(an: .turnOntheEngine)
print(car)
//подготовим шину которая вести 10 кило, для загрузки в багаж
car.loadUnLoadOfBaggage = 10

//Поставим шину в багажник нашего автомобиля
car.perform(an: .filling)
print(car)
car.perform(an: .unloading)
print(car)
