Feature: Reusable Functions

Background:
  * def locators = read('classpath:com/ui/automation/locator.json')
  * def testData = read('classpath:com/ui/automation/testData.json')
 
@ignore
Scenario: Login to Swag Labs
  * driver baseUrl
  * input(locators.usernameLocator, testData.users[0].username)
  * input(locators.passwordLocator, testData.users[0].password)
  * click('#login-button')