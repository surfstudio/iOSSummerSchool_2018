//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let mySerialQueue = DispatchQueue(label: "com.test.mySerial")

print("--- Имитация race condition ---")

var value = "😇"

func changeValue() {
    sleep(1)
    value = value + "🐔";
}

mySerialQueue.sync {
    changeValue()
}
//sleep(2)
value


//value = "🦊"
//mySerialQueue.sync {
//    changeValue(variant:2)
//}
//value
//sleep(3)

sleep(2)
PlaygroundPage.current.finishExecution()
