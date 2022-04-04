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
                print("Багаже нет столько места, вы можете вместить \(volumeBaggage) килограмм")
                print("Снизьте количество вещей загружаемых в багаж")
            } else {
                volumeBaggage -= loadUnLoadOfBaggage
            }
        case .unloading:
            volumeBaggage += loadUnLoadOfBaggage
        }
    }
    
    mutating func printInfoAboutCar() {
        let StartEnigine: String = { () -> String in
            if isWasStartEnigine {
                return "Заведен"
            } else { return "Не заведен"}
        }()
        let wasOpenOrCloseDoor: String = { () -> String in
            if isWasStartEnigine {
                return "Открыты"
            } else { return "Закрыты"}
        }()
        let wasFilledBaggage: String = { () -> String in
            if isWasFilledBaggage {
                return "Заполнен"
            } else { return "Свободен"}
        }()
        
        print("""
              "Модель: \(model), год выпуска: \(yearOfCar), Багаж: \(wasFilledBaggage) \nДвигатель: \(StartEnigine), окна в машине: \(wasOpenOrCloseDoor),\nВ багаже еще поместится: \(volumeBaggage) килограмм.
              """)
        print("---------------------------------------------------------------------")
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
                print("В багаже нет столько места, вы можете вместить \(volumeBaggage) килограмм")
                print("Снизьте количество вещей загружаемых в багаж")
            } else {
                volumeBaggage -= loadUnLoadOfBaggage
            }
        case .unloading:
            volumeBaggage += loadUnLoadOfBaggage
        }
    }
    
    mutating func printInfoAboutCar() {
        let StartEnigine: String = { () -> String in
            if isWasStartEnigine {
                return "Заведен"
            } else { return "Не заведен"}
        }()
        let wasOpenOrCloseDoor: String = { () -> String in
            if isWasStartEnigine {
                return "Открыты"
            } else { return "Закрыты"}
        }()
        let wasFilledBaggage: String = { () -> String in
            if isWasFilledBaggage {
                return "Заполнен"
            } else { return "Свободен"}
        }()
        
        print("""
              "Модель: \(model), год выпуска: \(yearOfCar), Багаж: \(wasFilledBaggage) \nДвигатель: \(StartEnigine), окна в машине: \(wasOpenOrCloseDoor),\nВ багаже еще поместится: \(volumeBaggage) килограмм.
              """)
        print("---------------------------------------------------------------------")
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

//Покупаем Майбах
var car = SportCar(model: "Mersedes-Benz MAYBACH", yearOfCar: 2022, volumeBaggage: 100)
car.printInfoAboutCar()
//заводим Майбах
car.perform(an: .turnOntheEngine)
car.printInfoAboutCar()
//подготовим шину которая вести 80 кило, для загрузки в багаж
car.loadUnLoadOfBaggage = 80
//Поставим шину в багажник нашего автомобиля
car.perform(an: .filling)
car.printInfoAboutCar()
//добавим еще 20 кило в багажник (сначала подготовим)
car.loadUnLoadOfBaggage = 20
//Загружаем
car.perform(an: .filling)
//печатаем результат
car.printInfoAboutCar()
//готовим еще 20
car.loadUnLoadOfBaggage = 20
//загружаем в багажник
car.perform(an: .filling)
//смотрим результат
car.printInfoAboutCar()
