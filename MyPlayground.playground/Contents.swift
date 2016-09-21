//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Playground - noun: a place where people can play


let individualScores = [12, 34, 18, 43]
var teamScore = 0
for score in individualScores {
    if score > 30{
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


//Optional and optional binding
//var optionalName : String? = nil
//var greeting = "Hello"
//if let name = optionalName {
//   print(greeting, name)
//    greeting = "Hello \(name)"
//} else {
//    print("There is no value")
//}

//Optional binding with where clause
var optionalName : String? = "John"
var greeting = "Hello"
if let name = optionalName where name.hasPrefix("J") {
    //if let name = optionalName where name.hasPrefix("K") {
    print(greeting, name)
    greeting = "Hello \(name)"
} else {
    print("There is no value")
}

let vegetable = "Celery"
switch vegetable {
case "Cabbage":
    let vegetableComment = "I like Cabb."
case "Celery" :
    let vegetableComment = "MM Celery"
default:
    let vegetableComment = "All is well"
}

//For loop
//var secondForLoop = 0
//for i in 0...4 {
//    secondForLoop += 1
//}
//print(secondForLoop)

//Question -pass by ref or pass by value?
var secondForLoop = 20
for _ in 0...3 {
    secondForLoop += 2
}
print(secondForLoop)

// Methods and functions - the methods are explicitly tied to the data type they are defined in like String methods or Array methods. Functions are custom and can belon to any data type.

var array = [1, 4, 52]
array.insert(6, atIndex: 3)
array


//Classes and inititalizers
class Shape {
    var numSides = 0
    func desc() -> String {
        return "A shape with \(numSides) sides."
    }
}


var triangle = Shape()
triangle.numSides = 3
var triDesc = triangle.desc()

class NamedShape{
    var sides: Double = 0
    var name: String
    
    init(shapeName : String) {
        self.name = shapeName
    }
    
    func desc() -> String {
        return "\(name) has \(sides) sides."
    }
}
var tri = NamedShape(shapeName: "myTri")
tri.sides = 3
var desctiption = tri.desc()

class Square: NamedShape {
    var sideLength: Double
    
    init(squareSideLength: Double, squareName: String) {
        self.sideLength = squareSideLength
        super.init(shapeName: squareName)
        sides = 4
    }
    
    func calculateArea() -> Double {
        return sideLength * sides
    }
    
    override func desc() -> String {
        return "The sidelength is \(sideLength) and area is \(calculateArea())"
    }
    
}

var firstSquare = Square(squareSideLength: 2.3, squareName: "firstSquare")
firstSquare.desc()
firstSquare.calculateArea()

class Circle: NamedShape {
    var radius: Double
    
    init? (circleRadius: Double, circleName: String) {
        self.radius = circleRadius
        super.init(shapeName: circleName)
        sides = 1
        if radius <= 0 {
            return nil
        }
    }
    
    override func desc() -> String {
        return "A circle with radius of \(radius)"
    }
}

let firstCircle = Circle(circleRadius: 2.5, circleName: "firstCircle")
firstCircle?.desc()
let secondCircle = Circle(circleRadius: -2.5, circleName: "firstCircle")
secondCircle?.desc()

class Triangle: NamedShape {
    init(triangleSideLength: Double, triangleName: String) {
        super.init(shapeName: triangleName)
        sides = 3
    }
}


//Typecasting

let shapesArray = [Square(squareSideLength: 2.3, squareName: "firstSquare"), Square(squareSideLength: 2.5, squareName: "firstSquare"), Triangle(triangleSideLength: 2.3, triangleName: "firstTriangle"), Triangle(triangleSideLength: 4.6, triangleName: "secondTriangle")]

var squares = 0
var triangles = 0

for shape in shapesArray {
    if let square = shape as? Square{
        squares += 1
    } else if let triangle = shape as? Triangle {
        triangles += 1
        
    }
    
}

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.King
let aceRawValue = ace.rawValue

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()






//: [Next](@next)
