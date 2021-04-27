/*
This program gets the type of food and number of food,
calculates and display the time to reheat in the microwave.
author  Jay Lee
version 1.0
since   2020-04-26
*/
import Foundation

enum InvalidInputError : Error {
  case invalidInput
}


let foodTypeList = ["PIZZA", "SUB", "SOUP"]
let individualTime: Float

// String Input
print("Are you heating a sub, pizza, or soup? ", terminator: "")
let foodType = String(readLine()!)

// Check user's food is sub, pizza or soup
if (foodTypeList.contains(foodType.uppercased())) {

  if (foodTypeList.firstIndex(of: foodType.uppercased()) == 0) {
    individualTime = 0.75  // Pizza: 45 seconds
  }
  else if (foodTypeList.firstIndex(of: foodType.uppercased()) == 1) {
    individualTime = 1.0  // Sub : 1 minute
  }
  else {
    individualTime = 1.75  // Soup: 1 minute 45 seconds
  }
  // Integer Input
  print("How many \(foodType)(s) are you heating (max 3 and they must all be "
      + "the same items)? ", terminator: "")
  
  do {
    guard let foodNumber = Int(readLine()!) else{
      throw InvalidInputError.invalidInput
    }

    if (Int(foodNumber) > 0 && Int(foodNumber) <= 3) {
      // Process
      let cookTime = (individualTime / Float(foodNumber)) 
                      * pow(3.0, (Float(foodNumber) - 1))
      // convert float minutes to minutes and seconds
      let cookTimeMin = floor(cookTime)
      let cookTimeSec = (cookTime - cookTimeMin) * 60

      // Output
      print("The total cook time is \(Int(cookTimeMin)) min \(cookTimeSec) "
            + "sec.")
    } else {
      print("Max number of food is 3.")
    }
  } catch {
    print("Invalid input.")
  }
} else {
  print("There is no food for the given type.")
}
print("\nDone.")
