import UIKit
// == THE SANDWICH MAN ========
// You have opened up a new sandwich shop where customers can build their own sandwiches from a provided list of ingredients. You have decided the following:
//  * A standard sandwich will cost $12 (…you're located in Gastown)
//  * A standard sandwich has up to 1 protein, up to 3 fruits or veggies, and up to 2 condiments
//  * For each extra ingredient, there is an additional charge of $0.50

// == Ingredients ==============
let proteins   = [ "chicken", "meatballs", "sardines", "turkey", "salmon", "bacon" , "soy something" ]
let veggies    = [ "lettuce", "onion", "cucumber", "sprouts", "carrot" ]
let fruits     = [ "tomato" ]
let condiments = [ "mayo", "mustard", "relish", "pickles", "ketchup" ]

// == Question 1 ===============
// A sandwich must contain at least 1 ingredient. Write a function called `hasAtLeastOneIngredient` that accepts an array of ingredients as an argument, and returns a boolean. If one or more ingredients are present, it should return true
//  i.e. An input of [ 'chicken', 'mustard', 'pickles'] would return true


// required question arrays, plus two test arrays for edge cases.
let chickenSandwich: [String] = [ "chicken", "mustard", "pickles" ]
let emptySandwich: [String] = []
let testSandwich: [String] = [ "high tops", "lego", "🤖" ]

func hasAtLeastOneIngredient(_ ingredients: [String]) -> Bool {
  var hasOneIngredient = false
  
  // statement will use below helper functions to check 'ingredients' array for any valid sandwich 'ingredient'
  // once found, will set 'hasOneIngredient' to true, and return that back
  if checkForProteins(ingredients) {
    hasOneIngredient = true
  } else if checkForVeggies(ingredients) {
    hasOneIngredient = true
  } else if checkForFruits(ingredients){
    hasOneIngredient = true
  } else if checkForCondiments(ingredients) {
    hasOneIngredient = true
  } else {}
  return hasOneIngredient
}

// following four functions are helpers designed to check each of the menu ingredient arrays for valid ingredients.
func checkForProteins(_ ingredients: [String]) -> Bool {
  var hasProtein: Bool = false
  for ingredient in ingredients {
    if proteins.contains(ingredient) {
      hasProtein = true
    }
  }
  return hasProtein
}

func checkForVeggies(_ ingredients: [String]) -> Bool {
  var hasVeggie: Bool = false
  for ingredient in ingredients {
    if veggies.contains(ingredient) {
      hasVeggie = true
    }
  }
  return hasVeggie
}

func checkForFruits(_ ingredients: [String]) -> Bool {
  var hasFruit: Bool = false
  for ingredient in ingredients {
    if fruits.contains(ingredient) {
      hasFruit = true
    }
  }
  return hasFruit
}

func checkForCondiments(_ ingredients: [String]) -> Bool {
  var hasCondiment:  Bool = false
  for ingredient in ingredients {
    if condiments.contains(ingredient) {
      hasCondiment = true
    }
  }
  return hasCondiment
}

// extra tests on the function, to ensure it will also return a false if there is nothing, or no correct ingredients.
hasAtLeastOneIngredient(chickenSandwich) // returns true
hasAtLeastOneIngredient(emptySandwich) // returns false
hasAtLeastOneIngredient(testSandwich) // returns false


// == Question 2 ===============
// A sandwich can only contain ingredients on the menu; if a sandwich contains an ingredient not on the menu, it should be removed. Write a function called `validateSandwich` that accepts an array of ingredients as an argument and returns only the valid ingredients as an array
//  i.e. An input of [ 'chicken', 'hammer', 36, 'swiss cheese' ] would return [ 'chicken' ]

// required question arrays, plus two test arrays for edge cases.
let questionTwoFirstSandwichOrder = [ "chicken", "hammer", 36, "swiss cheese" ] as [Any]
let questionTwoSecondSandwichOrder = [ "beef", "oil", 78000, 780.00, "high tops"] as [Any]
let questionTwoThreeSandwichOrder = [ "meatballs", "basketball", "pickles", "🥶" ] as [Any]


// function will intake an array filled with 'Any' objects, sort thru them only for valid string entries, and return an array of [String]
func validateSandwich(_ ingredients: [Any]) -> [String] {
  var convertedIngredients: [String] = []
  var validatedIngredients: [String] = []
  
  // fast enumerate thru 'ingredient' array, and sort out any valid strings
  for object in ingredients {
    if let stringIngredient = object as? String {
      convertedIngredients.append(stringIngredient)
    }
  }

  // fast enumerate thru the 'convertedIngredients' array, and check each 'ingredient' to see if it's valid
  // checked against each menu array, if it finds any that are valid, it appends it to 'validatedIngredients'
  for ingredient in convertedIngredients {
    if proteins.contains(ingredient) {
      validatedIngredients.append(ingredient)
    }
    
    if veggies.contains(ingredient) {
      validatedIngredients.append(ingredient)
    }
    
    if fruits.contains(ingredient) {
      validatedIngredients.append(ingredient)
    }
    
    if condiments.contains(ingredient) {
      validatedIngredients.append(ingredient)
    }
  }
  return validatedIngredients
}

// two extra tests on the function, to ensure it's in proper order.
validateSandwich(questionTwoFirstSandwichOrder) // returns ["chicken"]
validateSandwich(questionTwoSecondSandwichOrder) // returns []
validateSandwich(questionTwoThreeSandwichOrder) // returns ["meatballs", "pickles"]

// == Question 3 ===============
// Write a function that calculates the number of extra ingredients in a sandwich. It accepts an array of ingredients as an argument and returns the number of extra ingredients as an integer. Name the function whatever you like.
//  i.e. A sandwich containing ['turkey', 'lettuce', 'mayo', 'mayo', 'mayo' ] would return 1

// required question arrays, plus one test array to ensure it's working properly
let questionThreeFirstSandwichOrder = [ "turkey", "lettuce", "mayo", "mayo", "mayo" ]
let questionThreeSecondSandwichOrder = [ "cucumber","cucumber","cucumber", "bacon", "bacon", "bacon", "ketchup" ]


// function takes in an array 'ingredients', checks to see if any are repeated/extra, and returns only an Int of how many extras there are.
func checkForExtraIngredients(_ ingredients: [String]) -> Int {
  var hasHowManyExtraIngredients: Int = 0
  var countedIngredients: [String: Int] = [:]
  
  // fast enumerate thru the ingredient array, putting each ingredient into 'countedIngredients' dictionary, and at the same time, counting up how many times that ingredient is repeated
  for ingredient in ingredients {
    countedIngredients[ingredient] = (countedIngredients[ingredient] ?? 0) + 1
  }
  
  // fast enumerate thru 'countedIngredients' dictionary, if any entries have been repeated more then once, add one to 'hasHowManyExtraIngredients'
  for (_, amount) in countedIngredients {
    if amount > 1 {
      hasHowManyExtraIngredients += 1
    }
  }
  return hasHowManyExtraIngredients
}

// extra test to make sure it's working correctly, and will 'count' extras if more inputted.
checkForExtraIngredients(questionThreeFirstSandwichOrder) // returns 1
checkForExtraIngredients(questionThreeSecondSandwichOrder) // returns 2

// == Question 4 ===============
// Write a function that calculates the cost of a sandwich, based on the number of ingredients it contains. The function accepts 3 integers as arguments (proteinsCount, fruitsAndVeggiesCount, and condimentsCount) and returns the total cost of the sandwich as a double rounded to 2 decimal places.
//  i.e. An input of 1 (protein), 3 (fruits/veggies) and 4 (condiments) would return 13.00

// function takes in only 3 'Int' variables, representing how much of the following menu categories; protein, fruits and vegggies, and condiments.
func howMuchDoesSandwichCost(proteinsCount: Int, fruitsAndVeggiesCount: Int, condimentsCount: Int) -> Double {
  let kSandwichCost: Double = 12.00
  let kExtraIngredientCost: Double = 0.50
  var totalSandwichCost: Double = 0.00
  var extraProteinCost: Double = 0.00
  var extraFruitsAndVeggiesCost: Double = 0.00
  var extraCondimentsCount: Double = 0.00
  
  // next three if statements take in the entered corresponding number, subtract what's included in the default sandwich cost
  // and then multiply the remainder by 'kExtraIngredientCost'
  
  if proteinsCount > 1 {
    extraProteinCost = (Double(proteinsCount) - 1) * kExtraIngredientCost
  }
  
  if fruitsAndVeggiesCount > 3 {
    extraFruitsAndVeggiesCost = (Double(fruitsAndVeggiesCount) - 3) * kExtraIngredientCost
  }
  
  if condimentsCount > 2 {
    extraCondimentsCount = (Double(condimentsCount) - 2) * kExtraIngredientCost
  }
  
  // final calculation before the total is returned, adds the results form the above three if statements, adds them to the base sandwich cost
  // multiplies it by 100, then rounds that number off, before diving it by 100. So that we get the proper cash value
  totalSandwichCost = ((kSandwichCost + extraProteinCost + extraFruitsAndVeggiesCost + extraCondimentsCount) * 100).rounded() / 100
  
  return totalSandwichCost
}

// two extra tests on the function, hand calculated the results to make sure the math is correct.
howMuchDoesSandwichCost(proteinsCount: 1, fruitsAndVeggiesCount: 3, condimentsCount: 4) // returns 13
howMuchDoesSandwichCost(proteinsCount: 2, fruitsAndVeggiesCount: 5, condimentsCount: 10) // returns 17.5
howMuchDoesSandwichCost(proteinsCount: 1, fruitsAndVeggiesCount: 3, condimentsCount: 2) // returns 12

// == Question 5 ===============
// You've decided to increase the price of your add-ons. The new costs are: $1.50 for each extra protein, $0.75 for fruit/veggies and $0.50 for condiments. Write a function that calculates the cost of a sandwich, reflecting this price change. The function still accepts 3 integers as arguments and returns the total cost as a double
//  i.e. An input of 2 (protein) and 1 (fruits/veggies) would return 13.50


// below function is the same as above function, except that each of the entered categories, now have their own seperate costs
func howMuchDoesSandwichCostWithIncrease(proteinsCount: Int, fruitsAndVeggiesCount: Int, condimentsCount: Int) -> Double {
  let kSandwichCost: Double = 12.00
  let kExtraProteinCost: Double = 1.50
  let kExtraFruitsAndVeggiesCost: Double = 0.75
  let kExtraCondimentsCost: Double = 0.50
  
  var totalSandwichCost: Double = 0.00
  var extraProteinCost: Double = 0.00
  var extraFruitsAndVeggiesCost: Double = 0.00
  var extraCondimentsCount: Double = 0.00
  
  if proteinsCount > 1 {
    extraProteinCost = (Double(proteinsCount) - 1) * kExtraProteinCost
  }
  
  if fruitsAndVeggiesCount > 3 {
    extraFruitsAndVeggiesCost = (Double(fruitsAndVeggiesCount) - 3) * kExtraFruitsAndVeggiesCost
  }
  
  if condimentsCount > 2 {
    extraCondimentsCount = (Double(condimentsCount) - 2) * kExtraCondimentsCost
  }
  
  totalSandwichCost = ((kSandwichCost + extraProteinCost + extraFruitsAndVeggiesCost + extraCondimentsCount) * 100).rounded() / 100
  
  return totalSandwichCost
}

// same as the previous function, extra tests performed, and hand calculation as well.
howMuchDoesSandwichCostWithIncrease(proteinsCount: 2, fruitsAndVeggiesCount: 1, condimentsCount: 0) // returns 13.5
howMuchDoesSandwichCostWithIncrease(proteinsCount: 1, fruitsAndVeggiesCount: 3, condimentsCount: 2) // returns 12
howMuchDoesSandwichCostWithIncrease(proteinsCount: 5, fruitsAndVeggiesCount: 5, condimentsCount: 5) // returns 21

// == Bonus ====================
// You forgot to name your sandwich shop. What’s it called? Print this in the console as a string.

// prints out the shop's name to the console.
// Name chosen for something "rhymey"
let sandwichShopName = "Grease and Gruyere"
func shopName(_ name: String){
  print(name)
}
shopName(sandwichShopName)
