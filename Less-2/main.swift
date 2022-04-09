//  Car.swift
//  Created by Shamil Aglarov on 09.04.2022.
//

import Foundation

enum CarType {
    ///тип кузова
    case sedan
    case pickup
    case truck
    ///имя -> String
    var toString: String {
        switch self {
        case .sedan:
            return "Седан"
        case .pickup:
            return "Пикап"
        case .truck:
            return "Грузовик"
        }
    }
}
    
// MARK: - Car
class Car {

    enum CarAction {
        case openWindows
        case closeWindows
        case runEnigine
        case shutDownEnigine
        case loadStuff(volume: Double)
        case unloadStuff(volume: Double)
        case openForLoad
        case closeForLoad
    }
    //марка
    private let mark: String
    /// Год выпуска
    private let year: Int
    
    private var isHaveATurbine: Bool
    /// объем
    private let maxVolume: Double
    
    /// заполненный объем (количество)
    private var volume: Double = 0.0
    
    ///баланс количество оставшегося в багаже места
    var balance: Double
    
    /// запущен ли двигатель
    private var isEnigineActive = false {
        willSet {
            if newValue != isEnigineActive {
                print("Двигатель \(newValue ? "заведен":"заглушен)")")
            }
        }
    }
    ///открыты ли окна
    private var isWindowsOpened = false {
        willSet {
            if newValue != isEnigineActive {
                print("окна \(newValue ? "открыты" : "закрыты")")
            }
        }
    }
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
        printMenu()
    }
    
    func printMenu() {
        print("""
              ---------------------------------------------------------------
              Общие сведения об автомобиле:
              ---------------------------------------------------------------
              Марка автомобиля: \(mark)
              Год выпуска: \(year)г.
              Вместительность багажника - \(maxVolume) кг.
              Всего места осталось в багажнике \(self.maxVolume - volume) кг.
              Мотор \(isEnigineActive ? "заведен":"заглушен")
              Окна \(isWindowsOpened ? "открыты":"закрыты")
              ---------------------------------------------------------------
              """)
    }
    
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
    
    /// Действия через enum CarAction
    func doAction(_ action: CarAction) {
        switch action {
        case .openWindows:
            isWindowsOpened = true
        case .closeWindows:
            isWindowsOpened = false
        case .runEnigine:
            if isEnigineActive == true {
                print("Автомобиль уже заведен!")
            } else {
                isEnigineActive = true
            }
        case .shutDownEnigine:
            if isEnigineActive == true {
                print("Невозможно заглушить то, что и так заглушено!")
            } else {
                isEnigineActive = false
            }
        case .loadStuff(volume: let volume):
            loadStuff(inBaggage: volume)
            
        case .unloadStuff(volume: let volume):
            unloadStuff(fromBaggage: volume)
        case .openWindows:
            isWindowsOpened = true
        case .closeWindows:
            isWindowsOpened = false
        default:
            print("Машина такого не умеет")
        }
    }
}
final class SportCar: Car {
    
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
    
    init(mark: String, year: Int, maxVolume: Double) {
        super.init(mark: mark,
                   year: year,
                   maxVolume: maxVolume,
                   isHaveATurbine: true)
    }
    
    //запуск турбины
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

let carNumberOne = SportCar(mark: SportCar.MarkSportCheck.bmw.m5.toString,
                        year: 2021,
                        maxVolume: 200)

let carNumberTwo = SportCar(mark: SportCar.MarkSportCheck.lada.priora.ToString,
                        year: 2021,
                        maxVolume: 200)


carNumberOne.UltimateAbility(isStatusTrueAndFalse: true)
carNumberOne.doAction(.runEnigine)
carNumberOne.printMenu()


