Feature: TEK Retail Insurance API Test

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * def primaryPerson = callonce read("PostAccount.feature")

  @addPhone
  Scenario: Add Phone
    * def id = primaryPerson.response.id
    * param primaryPersonId = id
    * path "/api/accounts/add-account-phone"
    * request
      """
      {
      
      "phoneNumber": "2025458976",
      "phoneExtension": "123",
      "phoneTime": "Morning",
      "phoneType": "Cell"
      }
      """
    * method post
    * status 201

    
    @addPhone
  Scenario: Add Phone Two
    * def id = primaryPerson.response.id
    * param primaryPersonId = id
    * path "/api/accounts/add-account-phone"
    * request
      """
      {
      
      "phoneNumber": "2025458975",
      "phoneExtension": "124",
      "phoneTime": "Morning",
      "phoneType": "Cell"
      }
      """
    * method post
    * status 201