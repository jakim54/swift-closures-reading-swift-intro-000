# Closures


> I like turtles. 
 

## Learning Objectives

* 



# Functions as Types

Functions are something we should be very familiar with at this point.

Lets create a function called `showSomeLove(_:)` that takes in one argument called `person` of type `String` and returns a `String`. It will return back the individuals name appending the "<3" text to it.


```swift
func showSomeLove(person: String) -> String {
    return "\(person) <3"
}
```

Lets create a new constant called `result` assigning it the value of the return value of calling on `showSomeLove(_:)` passing in "Ann". Printing this `result` will display the "Ann <3" text to console.

```swift
let result = showSomeLove("Ann")
print(result)
// prints "Ann <3"
```

This function is a type. Just like `String`, `Int`, `Double`, it's a type. You would describe the type of this function by its argument and its return type.

So the type of this function is (`String`) -> `String`. We would say that it takes in a `String` and returns a `String`.

Lets test out this new found knowledge.

```swift
func hello() {
    print("Hello world.")
}
```

What type is this function? It's of type () -> ()

That means it takes in no arguments and returns nothing.

What about this function?

```swift
func average(a: Double, _ b: Double, _ c: Double) -> Double {
    return (a + b + c) / 3
}
```

The type of this function is (`Double`, `Double`, `Double`) -> `Double`

It takes in three arguments all of type `Double` and returns a `Double`.

Lets do one more.

```swift
func personStats(name name: String, age: Int) {
    print("Name is \(name), age is \(age)")
}
```

The type of this function is (`String`, `Int`) -> ()

It takes in two arguments, one of type `String`, the other of type `Int` and returns nothing.

So now that we know functions are types and can be described as such listing the argument types and their return type, what can we do with that?

We know that `String` is a type, right? And we saw above how we can actually use `String` as the type of an argument so when someone calls on our `showSomeLove(_:)` function they're required to give us a `String` which we can utilize within the implementation of our `showSomeLove(_:)` function.

Is there anything stopping us from having the type of a function (like the ones we created above) be the type of an argument of another function? YES. This is a very powerful concept, and one that is very useful.

Lets start simple. We know the type of our `hello()` function above is () -> ()

It takes in no arguments and returns nothing, so the type of the function is () -> ()

Lets create another function that takes in the type () -> () as an argument

```swift
func doSomethingWithFunction(function: () -> ()) {
    // Us calling on the function handed to us.
    function()
}
```

We just created a new function called `doSomethingWithFunction(_:)` that takes in on argument called `function` of type `() -> ()` and returns nothing. We are already familiar with how to co call on functions, so we can do so by calling on the function handed to us in our implemented like I did above.

But how do we call on this function? Lets demonstrate that.

```swift
doSomethingWithFunction(hello)
// prints "Hello world."
```

![](https://media.giphy.com/media/k7nUblXRPCsc8/giphy.gif)

Like we saw earlier, functions are types. The type of a function is made up of its arguments and its return type. The `hello()` function we created earlier is of type `() -> ()` in that it takes in no arguments and returns nothing.

Our `doSomethingWithFunction(_:)` has one argument of type `() -> ()`. That matches the `hello` function,  so we can pass the `hello()` function as an argument into the `doSomethingWithFunction(_:)` because the types match.

We can't just pass any function into the `doSomethingWithFunction(_:)`. 

![](http://i.imgur.com/5dJYiG1.png?1)

The reason that doesn't work is because the type of `personStats` which is a function doesn't match up with the what the `doSomethingWithFunction(_:)` method is looking for.

It's the same reason why this piece of code doesn't work.

![](http://i.imgur.com/yRJyLS8.png?1)

You can't pass in a `String` as an argument to a function that is asking for an `Int`. When calling on a function,  if it's asking for you to provide arguments you have to give it what it wants.

Lets step through one more example.

```swift
func printMathResult(mathFunction: (Int, Int) -> Int, firstNumber: Int, secondNumber: Int) {
    
}
```

This looks absolutely crazy, I know. But we got this. If you find yourself freaking out, go line by line, word by word, letter by letter. Slow it down, don't try to take in all of this at once, there are multiple moving parts here and each one by itself isn't difficult, its when they begin to work together where you start to freak out.. but we got you.

The name of this function is `printMathResult`. Easy enough, it has a name.

It takes in three arguments. That means if someone calls on this function (we we will soon), we will need to provide it with three things, lets go through each of those things.

The first argument to this function has a name. The name of the first argument is `mathFunction`. What's the type of this argument? Its type is `(Int, Int) -> Int`. We know how to read that! It's a function that takes in two arguments, both of which have to be of type `Int` and a return type of `Int`. Ok... so far so good. So anyone calling on this function (when they do so), _must_ provide a function as an argument (but not just any function). The function they provide to us must take in two arguments of its own (both of which must be type `Int`) and it must return an `Int`.

The second argument is called `firstNumber` and it is of type `Int`. Easy enough.

The third and last argument is called `secondNumber` and it is of type `Int`.

Lets implement this function now.

For now, lets just print our `firstNumber` and `secondNumber` argument.

```swift
func printMathResult(mathFunction: (Int, Int) -> Int, firstNumber: Int, secondNumber: Int) {
    
    print("The first number is \(firstNumber)")
    print("The second number is \(secondNumber)")
    
}
```

We know we can do this, we've been doing this throughout the entire course. We know how we can work with the arguments passed into our functions.

Lets though work with the `mathFunction` argument passed in. It itself is a function and we know how to call on functions.. so if we call on this function we have to give it what it wants. It wants two `Int`'s and! AND! when that particular function is done doing its thing (its implementation) it will return back to us an `Int`.

Actually, before we do that, lets look at this code.

```swift
func add(a: Int, _ b: Int) -> Int {
    return a + b
}

let result = add(5, 10) 
// 15
```

`add(_:_:)` is a function which takes in two arguments both of type `Int` and returns an `Int`. So we call on this function passing in what it wants and storing the return in a constant called `result`. We've done this multiple times throughout the course. There's NO difference in how we called on this `add(_:_:)` function here then how we would call on the `mathFunction` above within the implementation of `printMathResult` function above. So lets finish our implementation.

```swift
func printMathResult(mathFunction: (Int, Int) -> Int, firstNumber: Int, secondNumber: Int) {
    
    print("The first number is \(firstNumber)")
    print("The second number is \(secondNumber)")
    
    let result = mathFunction(5, 10)
       
}
```

Now you might think... `result` is 15! here. But, we don't know yet. Whomever calls on this `printMathResult` function must provide us with a function and its _that_ function's implementation which dictates the value of `result`. Crazy, I know but very powerful! Let me look for a gif to put here (be right back).

Feel free to peace out of here for a bit, get your bearings and come back.

![](https://media.giphy.com/media/np6xt2HVUk91u/giphy.gif)

Ok, welcome back.

Lets create a new function called `subtract` I'm going to add in some `print()` statements to help us see when things are getting called.

```swift
func subtract(a: Int, from b: Int) -> Int {
    print("The subtract function was called. It was given the numbers \(a) and \(b)")
    return b - a
}
```

```swift
func printMathResult(mathFunction: (Int, Int) -> Int, firstNumber: Int, secondNumber: Int) {
    
    print("The first number is \(firstNumber)")
    print("The second number is \(secondNumber)")
    
    let result = mathFunction(5, 10)
    
    print("The result is equal to \(result)")
    
}
```

Lets now call on the `printMathResult` function like this:

```swift
printMathResult(subtract, firstNumber: 50, secondNumber: 80)

// The first number is 50
// The second number is 80
// The subtract function was called. It was given the numbers 5 and 10
// The result is equal to 5
```

I highly suggest stepping through this code, reading the print statements to get a sense at when things are getting called.

Lets provide one more example:

```swift
func multiplyBy5ThenAdd(a: Int, _ b: Int) -> Int {
    print("multiplyBy5ThenAdd called with \(a) and \(b)")
    
    let newA = a * 5
    print("newA is \(newA)")
    
    let newB = b * 5
    print("newB is \(newB)")
    
    return newA + newB
}
```

```swift
printMathResult(multiplyBy5ThenAdd, firstNumber: 32, secondNumber: 9)

// The first number is 32
// The second number is 9
// multiplyBy5ThenAdd called with 5 and 10
// newA is 25
// newB is 50
// The result is equal to 75
```

---

# Functions as Return types

We know functions are types now. So can they also be the return value of a function and not just the type of one of its arguments? Yes.

We're creating a game, and you can step forward or step backward.

```swift
func stepForward(input: Int) -> Int {
    
    return input + 1
    
}

func stepBackward(input: Int) -> Int {
    
    return input - 1
    
}
```

Both functions have a type of `(Int) -> Int`

Lets create a function called `chooseStepFunction(_:)` that takes in an argument called `backwards` of type `Bool` and returns back a function of type `(Int) -> Int`. The function it returns should take in one `Int` as an argument and return an `Int`. That function signature is identical to the `stepForward(_:)` and `stepBackward(_:)` function we created earlier.

We can implement this function by looking at the `backWards` argument. If its value is `true`, then we should return back the `stepBackward` function. If it's `false` then we should return back the `stepForward` function.


```swift
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    
    if backwards {
        return stepBackward
    } else {
        return stepForward
    }
    
}
```

```swift
let howWeShouldMove = chooseStepFunction(true)
```

What type do you think the `howWeShouldMove` constant is?

Its type should what the return type is of the `chooseStepFunction` because that is what that function is returning back to us. The return type of `chooseStepFunction` is `(Int) -> Int`. 

![](http://i.imgur.com/XzO8Lgk.png?1)

So we have a constant that retains the value of a function that takes in an `Int` as an argument and returns an `Int`. How do we call on it?

Well, we do so like we have every other time we call on a function.

```swift
let result = howWeShouldMove(5)
// 4
```

We're calling on the `howWeShouldMove` function (it is a function) passing in an `Int` (the numeric literal 5) and storing what it returns (which is the number 4) in our `result` constant. `result` is an `Int` with the value of 4.

Last thing we'll cover.

```swift
var someCoolFunction: (String, Double) -> Int
```

Should the following code run?
```swift
someCoolFunction("Test", 5)
```

The answer is no. But do you know why? Don't forget, functions are types just like `String`'s so they behave the same way. You're trying to use a variable here that doesn't have a value. 

![](http://i.imgur.com/NY0LRJZ.png?1)

No difference if we tried doing the same thing with a `String` variable.

![](http://i.imgur.com/Yq52uIT.png?1)



<a href='https://learn.co/lessons/Closures' data-visibility='hidden'>View this lesson on Learn.co</a>
