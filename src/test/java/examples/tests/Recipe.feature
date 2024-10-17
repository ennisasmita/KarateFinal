Feature: Test Recipes
  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '168d166ec30c4ba7a862783bf66382ec'
    * def hash = '1e074b8a4cadc10c60bc4d6ba0ee84e0c98e8a9b'



  Scenario: Search Recipes by Nutriens
    Given path 'recipes/findByNutrients'
    And param hash = hash
    And param apiKey = apiKey
    And param minCarbs = 10
    And method get
    And status 200
    Then print response

  Scenario: Search Recipes by Ingredients
    Given path 'recipes/findByIngredients'
    And param hash = hash
    And param apiKey = apiKey
    And param ranking = 10
    And method get
    And status 200
    Then print response

  Scenario: Get Recipe Information Bulk
    Given path 'recipes/informationBulk'
    And param hash = hash
    And param apiKey = apiKey
    And param ids = '715538'
    And method get
    And status 200
    Then print response


