Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '168d166ec30c4ba7a862783bf66382ec'
    * def hash = '1e074b8a4cadc10c60bc4d6ba0ee84e0c98e8a9b'
    * def username = 'ennisasmita'
    * def startDate = '2024-02-25'

  Scenario: Test Generate MealPlan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame = 'day'
    And param targetCalories = '1200'
    And param diet = 'Ketogenic'
    And param exclude = 'shellfish'
    When method get
    Then status 200
    And print response

    Scenario: Adding items to meal plan
      Given path 'mealplanner', username, 'items'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param hash = hash
      And request {"date": 1708544224,"slot": 1,"position": 0,"type": "INGREDIENTS","value": {"ingredients": [{"name": "1 banana"}]}}
      When method post
      Then status 200
      And match response.status == 'success'
      And print response

    Scenario: Add items to Shopping List
      Given path 'mealplanner', username, 'shopping-list', 'items'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param hash = hash
      And request {"item": "1 package baking powder","aisle": "Baking","parse": true}
      When method post
      Then status 200
      And print response

  Scenario: Get Shopping List
    Given path 'mealplanner', username, 'shopping-list'
    And param hash = hash
    And param apiKey = apiKey
    And method get
    And status 200
    Then print response

  Scenario: ML model Image clasification
    Given path 'food/images/classify'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1630331721/attached_image/jarang-bertemu-dokter-berkat-manfaat-apel-0-alodokter.jpg'
    When method get
    Then status 200
    And print response