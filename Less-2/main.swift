
//  Car.swift
//  Created by Shamil Aglarov on 09.04.2022.
// Task number 5

import Foundation

enum CarAction {
    ///открыть окна
    case openWindows
    ///закрыть окна
    case closeWindows
    ///завести мотор
    case runEnigine
    ///заглушить мотор
    case shutDownEnigine
    ///загрузить в багаж -> (сколько)
    case loadStuff(volume: Double)
    ///выгрузить из багажа -> (сколько)
    case unloadStuff(volume: Double)
}

///возвращает текст о статусе мотора: заведен или заглушен
extension Bool {
    var EnigineActivOrNot: String {
        return self ? "заведен" : "заглушен"
    }
}

///возвращает текст о статусе окон: открыты или закрыты
extension Bool {
    var windowsOpenOrClose: String {
        return self ? "открыты" : "закрыты"
    }
}

protocol ActionProtocol {
    /// запущен ли двигатель
    var isEnigine: Bool { get set }
    
    ///открыты ли окна
    var isWindowsOpened: Bool { get set}
    
    //марка
    var mark: String { get set}
    
    /// Год выпуска
    var year: Int { get set }
    
    var isHaveATurbine: Bool { get set }
    /// объем
    var maxVolume: Double { get set }
    
    /// заполненный объем (количество)
    var volume: Double { get set }
    
    ///баланс количество оставшегося в багаже места
    var balance: Double { get set }
    
    /// печать общих сведений на экран консоли
    func printMenu()
    
    /// Загрузить груз в машину. Возвращает значение, сколько удалось загрузить
    func loadStuff(inBaggage volume: Double) -> Double
    
    /// Разгрузить  машину. Возвращает значение, сколько удалось разгрузить
    func unloadStuff(fromBaggage volume: Double) -> Double
    
    /// Действия через enum CarAction
    func doAction(_ action: CarAction)
}

class Car: ActionProtocol {
        
        var isEnigine: Bool = false
        
        var isWindowsOpened: Bool = false
        
        var isHaveATurbine: Bool
        
        var maxVolume: Double
        
        var volume: Double = 0.0
        
        var balance: Double
        
        var mark: String
        
        var year: Int
        
    /// конструктор с базовыми параметрами
    init (mark: String,
          year: Int,
          maxVolume: Double,
          isHaveATurbine: Bool) {
        self.mark = mark
        self.maxVolume = maxVolume
        self.year = year
        self.isHaveATurbine = isHaveATurbine
        balance = self.maxVolume
    }
    
    func printMenu() {
        print("""
              ---------------------------------------------------------------
              Общие сведения об автомобиле:
              ---------------------------------------------------------------
              Год выпуска: \(year)г.
              Вместительность багажника - \(maxVolume) кг.
              Всего места осталось в багажнике \(self.maxVolume - volume) кг.
              Мотор \(isEnigine.EnigineActivOrNot)
              Окна \(isWindowsOpened.windowsOpenOrClose)
              ---------------------------------------------------------------
              """)
    }
}

extension Car {
    /// Действия через enum CarAction
    func doAction(_ action: CarAction) {
        switch action {
        case .openWindows:
            isWindowsOpened = true
        case .closeWindows:
            isWindowsOpened = false
        case .runEnigine:
            if isEnigine {
                print("Автомобиль уже заведен!")
            } else {
                isEnigine = true
            }
        case .shutDownEnigine:
            if isEnigine == false {
                print("Невозможно заглушить то, что и так заглушено!")
            } else {
                isEnigine = false
            }
        case .loadStuff(volume: let volume):
            loadStuff(inBaggage: volume)
            
        case .unloadStuff(volume: let volume):
            unloadStuff(fromBaggage: volume)
        default:
            print("Машина такого не умеет")
        }
    }
}

extension Car {
    
    /// Загрузить груз в машину. Возвращает значение, сколько удалось загрузить
    func loadStuff(inBaggage volume: Double) -> Double {
        guard volume > 0 else { return 0 }
        guard balance > 0 else {
            print("Багаж полный, в нее ранее было загружено все \(maxVolume) кг.")
            return 0
        }
        guard volume <= maxVolume else {
            print("Невозможно поместить в багаж вещей на \(volume) килограмм!")
            print("Удалось загрузить лишь \(maxVolume - self.volume) килограмм")
            self.volume = maxVolume
            balance = 0
            return self.volume
        }
        if balance-volume == 0 {
            print("Вы успешно загрузили в багаж \(volume) кг. вещей")
            self.volume += volume
            balance = 0
            return self.volume
        } else if balance-volume < 0 {
            print("Нельзя поместить в багаж вещей на \(volume) килограмм!")
            print("так-как до этого в багаже уже было загружено вещей на \(self.volume) кг.\nА общая вместительность багажника равна \(maxVolume) кг.\nУдалось загрузить лишь \(volume-self.volume) килограмм вещей в багажник")
            balance = 0
            return volume-self.volume
        } else if balance-volume > 0 {
            print("Вы успешно загрузили в багаж \(volume) кг. вещей")
            print("Сейчас в багаже свободного места осталось на \(balance-volume) кг.")
            balance = balance-volume
            self.volume = volume
            return self.volume
        }
        return 0
    }
    
    /// Разгрузить  машину. Возвращает значение, сколько удалось разгрузить
    func unloadStuff(fromBaggage volume: Double) -> Double {
        guard volume > 0 else { return 0 }
        guard self.volume != 0 else { print("Багажник пустой, вытаскивать нечего!"); return 0}
        if volume > self.volume {
            print("В багажнике лежали вещи на \(self.volume) кг.")
            print("вместо \(volume) кг запрошенных, \nвыгрузили все \(self.volume) кг. вещей")
            print("Багажник сейчас пустой ")
            balance += self.volume
            self.volume -= self.volume
            return 0
        } else {
            self.volume -= volume
            balance += volume
            print("Выгружено вещиц на \(volume) кг\nВ багажник забит вещами на \(self.volume) кг.")
            print("Свободного места осталось еще на \(balance) кг.")
            return volume
        }
    }
}

// MARK: - Sportcar

final class SportCar: Car {

    init(mark: String, year: Int, maxVolume: Double) {
        super.init(mark: mark,
                   year: year,
                   maxVolume: maxVolume,
                   isHaveATurbine: true)
    }
    
    enum TurbineStatus {
        case start
        case stop
        var toString: String {
            switch self {
            case .start:
                return "Турбина запущена"
            case .stop:
                return "Турбина выключена"
            }
        }
    }
    ///Описываем марки автомобиля
    enum MarkSportCheck {
        ///Производство автомобильной марки: Россия
        enum lada {
            ///название модели
            case priora
            ///название модели
            case vesta
            ///название модели
            case xray
            ///название модели
            case granta
            
            var ToString: String {
                switch self {
                case .granta:
                   return "Гранта"
                case .priora:
                    return "Приора"
                case .vesta:
                    return "Веста"
                case .xray:
                    return "Х-Ray"
                }
            }
        }
        ///Производство автомобильной марки: Германия
        enum bmw {
            ///название модели
            case x5
            ///название модели
            case m5
            ///название модели
            case i8
            ///название модели
            case x6
            /// название модели -> String
            var toString: String {
                switch self {
                case .i8:
                    return "I-8"
                case .m5:
                    return "M-5"
                case .x5:
                    return "X-5"
                case .x6:
                    return "X-6"
                }
            }
        }
    }
    
    ///запуск турбины
    func UltimateAbility(isStatusTrueAndFalse turbine: Bool) {
        print("\(turbine ? TurbineStatus.start.toString: TurbineStatus.stop.toString)")
    }
}

// MARK: - TrunkCar
final class TrunkCar: Car {
    enum TrunkMark {
        ///Производство автомобильной марки: Россия
        enum lada {
            ///название модели
            case largus

            
            var ToString: String {
                switch self {
                case .largus:
                   return "Ларгус"
                }
            }
        }
        ///Производство автомобильной марки: Россия
        enum Kamaz {
            ///название модели
            case fourThousandTwoHundredAndEight
            /// название модели -> String
            var toString: String {
                switch self {
                case .fourThousandTwoHundredAndEight:
                    return "4208"
                }
            }
        }
    }
}

let sportCar = SportCar(mark: SportCar.MarkSportCheck.bmw.m5.toString,
                        year: 2021,
                        maxVolume: 200)

sportCar.doAction(.runEnigine)
sportCar.printMenu()
sportCar.loadStuff(inBaggage: 50)
sportCar.printMenu()
