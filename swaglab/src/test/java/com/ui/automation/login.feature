Feature: Swag Labs Login


Scenario: Login with Valid Credentials
  * call read('function.feature')

  # Add any assertions or verifications here if needed
  * match driver.url == baseUrl + 'inventory.html'