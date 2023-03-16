Feature: TEK Insurance API Post Request

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization  = "Bearer " + token
    * def primaryPerson = callonce read("PostAccount.feature")
    * def id = primaryPerson.response.id

  @AddAccountCar
  Scenario: Post Primary Account Service Test
    * param primaryPersonId = id
    * path "/api/accounts/add-account-car"
    * request
      """
      {
      "id": 0,
      "make": "Benz",
      "model": "xx8",
      "year": "2024",
      "licensePlate": "tek-231"
       }
      """
    * method post
    * status 201
    * print response

  @AddAccountCar
  Scenario: Post Primary Account Service Test
    * param primaryPersonId = id
    * path "/api/accounts/add-account-car"
    * request
      """
      {
      "id": 0,
      "make": "Benz",
      "model": "xx8",
      "year": "2024",
      "licensePlate": "tek-232"
       }
      """
    * method post
    * status 201
    * print response
