Feature: Pet API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API"


  Scenario: Add New Pet to Store
    * def reqBody = { "id": 1436,"category": {"id": 1,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method post
    Then print response
    And status 200

    Scenario: Find Pet by Status
      When url "https://petstore.swagger.io/v2/pet/1436"
      And method get
      Then print response
      And status 200

  Scenario: Delete Pet by ID
    * def reqHeader = { 'api_key': 'special_key' }
    When url "https://petstore.swagger.io/v2/pet/1436"
    And headers reqHeader
    And method delete
    Then print response
    And status 200


