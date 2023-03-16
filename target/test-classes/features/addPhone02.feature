@test
Feature: Tek Insurance API Test

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * def primaryPerson = callonce read("PostAccount02.feature")
    * def id = primaryPerson.response.id
    * param primaryPersonId = id

  Scenario: Add Phone
    * path "/api/accounts/add-account-phone"
    * def info = Java.type("test.api.DataGenerator")
    * def phoneNumber = info.getPhoneNumber()
    * def phoneExtention = info.getPhonExtention()
    * def phoneTime = info.getPhonTime()
    * def phoneType = info.getPhoneType()
    * request
      """
      { "id": 1950,
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "#(phoneExtention)",
        "phoneTime": "#(phoneTime)",
        "phoneType": "#(phoneType)"
      }
      """
    * method post
    * status 201
    * print response
    * print id

  Scenario: Update Phone
    * path "/api/accounts/update-account-phone"
    * def info = Java.type("test.api.DataGenerator")
    * def phoneNumber = info.getPhoneNumber()
    * def phoneExtention = info.getPhonExtention()
    * def phoneTime = info.getPhonTime()
    * def phoneType = info.getPhoneType()
    * request
    """
     {  "id": 1950,
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "#(phoneExtention)",
        "phoneTime": "#(phoneTime)",
        "phoneType": "#(phoneType)"
      }
    
    """
    * method put
    * status 200
    * print response
    
    
    
    
    
    
    
