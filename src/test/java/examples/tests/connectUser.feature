Feature: Get User Hash and Uname
  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '168d166ec30c4ba7a862783bf66382ec'

  Scenario: Get username and hash from connect user
    Given path 'users/connect/'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "ennisasmita","firstName": "Ennist","lastName": "Sasmita","email": "ennisasmita@gmail.com"}
    When method post
    Then status 200
    And print response