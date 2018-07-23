//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//: Определяем бесконечное выполнение, чтобы предотвратить "выбрасывание" background tasks, когда работа на Playground будет закончена.
PlaygroundPage.current.needsIndefiniteExecution = true

//: ## Использование Global Queues
//: 1. Глобальная последовательная (serial) main queue

let mainQueue = DispatchQueue.main

//: 2. Глобальные  concurrent dispatch queues

let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let userQueue = DispatchQueue.global(qos: .userInitiated)
let utilityQueue = DispatchQueue.global(qos:  .utility)
let backgroundQueue = DispatchQueue.global(qos:  .background)

let defaultQueue = DispatchQueue.global() // .default concurrency

func task(_ symbol: String) { for i in 1...10 {
    print("\(symbol) \(i) приоритет = \(qos_class_self().rawValue)")
    }
}

//userQueue.async {task("😀")}
//userQueue.async {task("👿")}
//task("👿")


//Последовательная очередь  mySerialQueue

//let mySerialQueue = DispatchQueue(label: "com.test.mySerial")
//mySerialQueue.async {task("😀")}
//mySerialQueue.async {task("😀")}
//task("👿")

//Последовательная очередь  mySerialQueue с изменением приоритета

let mySerialQueue = DispatchQueue(label: "com.test.mySerial", qos: .userInitiated)

//mySerialQueue.async {task("😀")}
//mySerialQueue.async {task("👿")}
//task("👿")

//let mySerialQueue1 = DispatchQueue(label: "com.test.mySerial1", qos: .background)
//let mySerialQueue2 = DispatchQueue(label: "com.test.mySerial2", qos: .userInteractive)
//
//mySerialQueue1.async {task("😀")}
//mySerialQueue2.async {task("👿")}

let myWorkerQueue = DispatchQueue(label: "com.test.myWorkerQueue", qos: .userInteractive, attributes: .concurrent)
myWorkerQueue.async {task("😀")}
myWorkerQueue.async {task("👿")}

//let myWorkerQueue1 = DispatchQueue(label: "com.test.myWorkerQueue1", qos: .userInteractive, attributes: .concurrent)
//let myWorkerQueue2 = DispatchQueue(label: "com.test.myWorkerQueue2", qos: .background, attributes: .concurrent)
//myWorkerQueue1.async {task("😀")}
//myWorkerQueue2.async {task("👿")}

sleep (1)
PlaygroundPage.current.finishExecution()
