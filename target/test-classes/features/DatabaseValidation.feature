Feature: Tek Insurance DB Validation
  @test
  Scenario: Database connection Test
    * def getAPIRequest = call read("GetPrimaryAccount02.feature")
    * def id = getAPIRequest.response.id
    * def dataBaseUtility = Java.type("test.api.DataBaseUtility")
    * def dataBaseEmail = dataBaseUtility.result("select email from primary_Person where id = '" +id+"'","email")
    * print dataBaseEmail
    * def responseEmail = getAPIRequest.response.email
    * match responseEmail == dataBaseEmail
    * print responseEmail
    * print dataBaseEmail