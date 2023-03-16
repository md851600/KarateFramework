@test
Feature: Tek Insurance API Test

  Background: 
    Given url BaseURL
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer " + token
    * def primaryPerson = callonce read("PostAccount02.feature")
    * def id = primaryPerson.response.id

  Scenario: Add Car
    * path "/api/accounts/add-account-car"
    * param primaryPersonId = id
    * def generate = Java.type("test.api.DataGenerator")
    * def make = generate.getCarMake()
    * def model = generate.getCarModel()
    * def year = generate.getCarYear()
    * def plate = generate.getLicensePlate()
    * request
      """
      {
        "id":2071,
        "make": "#(make)",
        "model": "#(model)",
        "year": "#(year)",
        "licensePlate": "#(plate)"
      }
      """
    * method post
    * print response
    * status 201

  Scenario: Update Car
    * path "/api/accounts/update-account-car"
    * param primaryPersonId = id
    * def generate = Java.type("test.api.DataGenerator")
    * def make = generate.getCarMake()
    * def model = generate.getCarModel()
    * def year = generate.getCarYear()
    * def plate = generate.getLicensePlate()
    * request
      """
      {
        "id": 2071,
        "make": "#(make)",
        "model": "#(model)",
        "year": "#(year)",
        "licensePlate": "#(plate)"
      }
      """
    * method put
    * print response
    * status 200
