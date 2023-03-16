Feature: Tek Insurance API Test

  @test
  Scenario: get account
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * path "/api/accounts/get-primary-account"
    * def primaryPerson = call read("PostAccount02.feature")
    * def id = primaryPerson.response.id
    * param primaryPersonId = id
    * method get
    * status 200
    * print response
    * def responseId = response.id
    * match responseId == id
    * def responseEmail = response.email
    * match responseEmail == primaryPerson.response.email
