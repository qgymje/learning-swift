//: Playground - noun: a place where people can play

import UIKit

var str: String?

str?.lowercaseString

print("hello \(str?.lowercaseString)")

let possibleNumber = "a"
let convertedNumber: Int? = Int(possibleNumber)

if let num = convertedNumber {
    print("convert is ok and the number is \(num)")
} else {
    print("convert was failed")
}

// Optional is just a enum
let str1 = Optional<String>.None
let str2 = Optional<String>.Some("hello")
let str3: String = ["a","b","c"].joinWithSeparator(",")

protocol MyProtocol {
    static func foo(input input:String) -> String
}

class MyClass: MyProtocol {
    static var bar: String?
    
    static func foo(input input:String) -> String {
        return "My class foo \(input)"
    }
    
    func bar(input: String, input2: String, input3: String = "input3") -> String {
        return "input1 = \(input), input2 = \(input2), input3 = \(input3)"
    }
}

MyClass.foo(input: "hello")
let myClass1 = MyClass()
myClass1.bar("first one", input2: "second", input3: "kakaka")

struct MyStruct {
    static let foo: String = "my struct"
}

let button = UIButton(type: .System)

let arr1 = ["a", "c", "d", "b", "f"]
let arr2 = arr1.sort{$0 < $1}
arr1
arr2

let str4 = "swift string"
(str4 as NSString).length

let defaults = NSUserDefaults.standardUserDefaults()