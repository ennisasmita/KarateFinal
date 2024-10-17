Feature: Get OAuth Token

  Background:
    * def clientID = 'client-id'
    * def clientSecret = 'clientSecret'
    * def tokenUrl = 'https://serverendpoint.com/oauth/token'

  Scenario: Get OAuth Token using client credentials
    Given url tokenUrl
    And request {grant_type: 'client_credentials', client_id: clientID, client_secret: clientSecret}
    And header Content-Type = 'application/x-www-form-urlencoded'
    When method POST
    Then status 200
    * def access_token = response.access_token


karate.callSingle('classpath:store-token.feature', {access_token: access_token})