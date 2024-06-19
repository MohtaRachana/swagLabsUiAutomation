Feature: Swag Labs Test

  Background: 
    * configure driver = { type: 'chrome' }

  Scenario Outline: valid login
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    * delay(2000)

    Examples: 
      | username      | password     |
      | standard_user | secret_sauce |

  Scenario Outline: Invalid login
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    * delay(2000)

    Examples: 
      | username | password |
      | standard | secret   |

  Scenario Outline: valid username and invalid password
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    * delay(2000)

    Examples: 
      | username      | password |
      | standard_user | secret   |

  Scenario Outline: Invalid username and valid password
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    * delay(2000)

    Examples: 
      | username | password     |
      | standard | secret_sauce |

  Scenario Outline: Invalid login with blank credintial
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    * delay(2000)

    Examples: 
      | username | password |
      |          |          |
