@test
Feature: Tek Insurance API Tes

  Background: 
    Given url BaseURL
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * def primaryPerson = callonce read("PostAccount02.feature")
    * def id = primaryPerson.response.id

  Scenario: add address
    * path "/api/accounts/add-account-address"
    * param primaryPersonId = id
    * def address = Java.type("test.api.DataGenerator")
    * def addressType = address.getAddressType()
    * def addressLine1 = address.getAddressLine1()
    * def city = address.getCity()
    * def state = address.getState()
    * def postalCode = address.getPostalCode()
    * def countryCode = address.getCountryCode()
    * request
      """
      {
        "addressType": "#(addressType)",
        "addressLine1": "#(addressLine1)",
        "city": "#(city)",
        "state": "#(state)",
        "postalCode": "#(postalCode)",
        "countryCode": "#(countryCode)",
        "current": true
      }
      """
    * method post
    * status 201
    * print response

  Scenario: update address
    * path "/api/accounts/update-account-address"
    * param primaryPersonId = id
    * def address = Java.type("test.api.DataGenerator")
    * def addressType = address.getAddressType()
    * def addressLine1 = address.getAddressLine1()
    * def city = address.getCity()
    * def state = address.getState()
    * def postalCode = address.getPostalCode()
    * def countryCode = address.getCountryCode()
    * request
      """
      {
      "addressType": "#(addressType)",
      "addressLine1": "#(addressLine1)",
      "city": "#(city)",
      "state": "#(state)",
      "postalCode": "#(postalCode)",
      "countryCode": "#(countryCode)",
      "current": true
      } 

      """
    * method put
    * status 200
    * print response
