Feature: Store token

  Scenario: Store OAuth token
    * def access_token = __arg.access_token
    * karate.set('bearerToken', accessToken)