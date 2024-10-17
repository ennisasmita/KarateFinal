Feature: Other feature that user bearer token

  Background:
    * def token = karate.get('bearerToken')
    * def authHeader = {Authorization: 'Bearer ' + token}

  Scenario:
    Given url 'https://blaba.com'
    And headers authHeader