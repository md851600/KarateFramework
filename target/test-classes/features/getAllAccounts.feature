Feature: Tek Insurance API Test
  
  @getAllAccounts
  Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Autorization = "Bearer " + token
    * path "/api/accounts/all-accounts"
    * method get
    #* status 200
    * print response
