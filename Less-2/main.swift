
//  Car.swift
//  Created by Shamil Aglarov on 17.04.2022.
// Task number 6

import Cocoa

struct Person<T> {
    
    var workers: [Worker<T>]? = []
    
    func printWorker() {
        workers?.forEach { " \(print($0.name,                                                                                                $0.job?.toString ?? "nil",                                                                              $0.salary))"}
    }
    
    mutating func addWorker(name: T,
                            job: Job.NameJob,
                            salary: T) {
        workers?.append(Worker<T> (name: name ,
                                   job: job,
                                   salary: salary))
    }
}

struct Worker<T> {
    
    let name: T
    
    let job: Job.NameJob?
    
    let jobWork: Job? = Job()
    
    let salary: T
    
    init(name: T,
         job: Job.NameJob,
         salary: T) {
        self.name = name
        self.job = job
        self.salary = salary
    }
}

struct Job {
    enum NameJob {
        case programmer
        case teacher
        case driver
        case bissnesMan
        
        var toString: String {
            switch self {
            case .programmer: return "Программист"
            case .driver: return "Водитель"
            case .bissnesMan: return "Бизнесмен"
            case .teacher: return "Учитель"
            }
        }
    }
}
var person = Person<Any>()


person.addWorker(name: "Шамиль",
                 job: Job.NameJob.bissnesMan,
                 salary: "8000")

person.addWorker(name: 110101,
                 job: Job.NameJob.driver,
                 salary: 1000)
person.printWorker()
