import UIKit
// == THE SANDWICH MAN ========
// You have opened up a new sandwich shop where customers can build their own sandwiches from a provided list of ingredients. You have decided the following:
//  * A standard sandwich will cost $12 (…you're located in Gastown)
//  * A standard sandwich has up to 1 protein, up to 3 fruits or veggies, and up to 2 condiments
//  * For each extra ingredient, there is an additional charge of $0.50

// == Ingredients ==============
let proteins   = [ "chicken", "meatballs", "sardines", "turkey", "salmon", "bacon" ,  "soy something"  ]
let veggies    = [ "lettuce", "onion", "cucumber", "sprouts", "carrot" ]
let fruits     = [ "tomato" ]
let condiments = [ "mayo", "mustard", "relish", "pickles", "ketchup" ]

// == Question 1 ===============
// A sandwich must contain at least 1 ingredient. Write a function called `hasAtLeastOneIngredient` that accepts an array of ingredients as an argument, and returns a boolean. If one or more ingredients are present, it should return true
//  i.e. An input of [ 'chicken', 'mustard', 'pickles'] would return true
let chickenSandwich = ["chicken", "mustard", "pickles"]

func hasAtLeastOneIngredient(_ ingredients:[String]) -> Bool {
  var hasOneIngredient = false
  
  if (hasOneIngredient == false) && (checkForProteins(ingredients) == true) {
    hasOneIngredient = true
  }
  
  if (hasOneIngredient == false) && (checkForVeggies(ingredients) == true) {
    hasOneIngredient = true
  }
  
  if (hasOneIngredient == false) && (checkForFruits(ingredients) == true) {
    hasOneIngredient = true
  }
  
  if (hasOneIngredient == false) && (checkForCondiments(ingredients) == true) {
    hasOneIngredient = true
  }
  return hasOneIngredient
}

func checkForProteins(_ ingredients:[String]) -> Bool {
  var hasProtein:Bool = false
  for ingredient in ingredients {
    if proteins.contains(ingredient) {
      hasProtein = true
    }
  }
  return hasProtein
}

func checkForVeggies(_ ingredients:[String]) -> Bool {
  var hasVeggie:Bool = false
  for ingredient in ingredients {
    if veggies.contains(ingredient) {
      hasVeggie = true
    }
  }
  return hasVeggie
}

func checkForFruits(_ ingredients:[String]) -> Bool {
  var hasFruit:Bool = false
  for ingredient in ingredients {
    if fruits.contains(ingredient) {
      hasFruit = true
    }
  }
  return hasFruit
}

func checkForCondiments(_ ingredients:[String]) -> Bool {
  var hasCondiment:Bool = false
  for ingredient in ingredients {
    if condiments.contains(ingredient) {
      hasCondiment = true
    }
  }
  return hasCondiment
}

hasAtLeastOneIngredient(chickenSandwich)
//checkForProteins(chickenSandwich)
//checkForVeggies(chickenSandwich)
//checkForFruits(chickenSandwich)
//checkForCondiments(chickenSandwich)


// == Question 2 ===============
// A sandwich can only contain ingredients on the menu; if a sandwich contains an ingredient not on the menu, it should be removed. Write a function called `validateSandwich` that accepts an array of ingredients as an argument and returns only the valid ingredients as an array
//  i.e. An input of [ 'chicken', 'hammer', 36, 'swiss cheese' ] would return [ 'chicken' ]

let firstSandwichOrder = ["chicken", "hammer", "36", "swiss cheese"]

func validateSandwich(_ ingredients: [String]) -> [String] {
  var validatedIngredients:[String] = []

  for ingredient in ingredients {
    
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

validateSandwich(firstSandwichOrder)



// == Question 3 ===============
// Write a function that calculates the number of extra ingredients in a sandwich. It accepts an array of ingredients as an argument and returns the number of extra ingredients as an integer. Name the function whatever you like.
//  i.e. A sandwich containing ['turkey', 'lettuce', 'mayo', 'mayo', 'mayo' ] would return 1





// == Question 5 ===============
// You've decided to increase the price of your add-ons. The new costs are: $1.50 for each extra protein, $0.75 for fruit/veggies and $0.50 for condiments. Write a function that calculates the cost of a sandwich, reflecting this price change. The function still accepts 3 integers as arguments and returns the total cost as a double
//  i.e. An input of 2 (protein) and 1 (fruits/veggies) would return 13.50


// == Bonus ====================
// You forgot to name your sandwich shop. What’s it called? Print this in the console as a string.
let sandwichShopName = "Grease and Gruyere"
func shopName(_ name: String){
  print(name)
}
shopName(sandwichShopName)
