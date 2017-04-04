//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func showSomeLove(person: String) -> String {
    return "\(person) ❤️"
}

let result = showSomeLove(person: "Ann")
print(result)

var name = "James"
print(showSomeLove(person: name))

var person = showSomeLove(person: name)
print(person)

func hello() {
    print("Hello World!")
}

func greetingsFromFlynn() {
    print("Greetings Programs!")
}

func averageGuy(_ name: String, age: Int) {
    print("Name is \(name), age is \(age).")
}

var averageJoe = averageGuy("Joe", age: 21)

// example of closure, a function getting a function and executing/getting the value.
// prints "Greetings Programs!"
doSomethingWithFunction(function: greetingsFromFlynn)
// a break

func doSomethingWithFunction(function: () -> ()) {
    // Us calling on the function handed to us.
    function()
}

// moved the various functions here for printMathResult
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(a: Int, from b: Int) -> Int {
    print("The subtract function was called. It was given the numbers a: \(a) and b: \(b)")
    return b - a
}

func multiplyByFiveThenAdd(_ a: Int, _ b: Int) -> Int {
    print("multiplyByFiveThenAdd called. It was given the numbers a: \(a) and b: \(b)")
    
    let newA = a * 5
    print("newA is \(newA)")
    
    let newB = b * 5
    print("newB is \(newB)")
    
    return newA + newB
}

// break for statement organization ==============================================================================
print("\n")

func printMathResult(mathFunction: (Int, Int) -> Int, firstNumber: Int, secondNumber: Int) {
    
    print("The first number is \(firstNumber)")
    print("The second number is \(secondNumber)")
    
    let result = mathFunction(firstNumber, secondNumber)
    print("The result is equal to \(result)")
    
}

printMathResult(mathFunction: subtract(a:from:), firstNumber: 50, secondNumber: 80)
print("") // need a spacer
printMathResult(mathFunction: multiplyByFiveThenAdd(_:_:), firstNumber: 3, secondNumber: 9)
// break for statement organization ==============================================================================
print("\n")

func stepFoward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

// It's essentially returning a function, but due to type inference, the set of parentheses is removed
func chooseStepFunction(_ backwards: Bool) -> (Int) -> Int {
    if backwards {
        return stepBackward
    } else {
        return stepFoward
    }
}

let howWeShouldBeMoving = chooseStepFunction(true)
let closureTest = howWeShouldBeMoving(5)
// When a function is returned, it is also invoked.
// Took true first, which initiates stepBackward, which takes 5 from above, then 5 - 1, which is 4.
print(closureTest)

// break for statement organization ==============================================================================
print("\n")




