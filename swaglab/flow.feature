Feature: Complete flow of the application

  Background: 
    * configure driver = { type: 'chrome' }

  Scenario Outline: validate complete flow of the application
    Given driver 'https://www.saucedemo.com/'
    * driver.maximize()
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    
    * call read('classpath:com/ui/automation/completeflow/handle_alert.feature')

    * delay(2000)
    # Add items to cart and verify in the cart page
    * delay(2000)
    * waitFor("//button[text()='Add to cart']").exists
    * def addToCartButtons = driver.locateAll("//button[text()='Add to cart']")
    * def itemCount = addToCartButtons.length
    * print 'Total Add to Cart buttons: ', itemCount
    * eval karate.forEach(addToCartButtons, button => driver.click(button.locator))
    * driver.click("//a[@class='shopping_cart_link']")

    * call read('classpath:com/ui/automation/completeflow/handle_alert.feature')

    * delay(2000)
    * def cartItems = driver.locateAll("//div[@class='cart_item']")
    * def cartItemCount = cartItems.length
    * print 'Total items in the cart: ', cartItemCount

    # Remove item from the cart
    And click("//button[@id='remove-sauce-labs-backpack']")
    * delay(1000)
    And scroll("//button[@id='continue-shopping']").click()
    Given driver 'https://www.saucedemo.com/inventory.html'

    * call read('classpath:com/ui/automation/completeflow/handle_alert.feature')

    # Add new item to cart
    And click("//button[@id='add-to-cart-sauce-labs-backpack']")
    And click("//a[@class='shopping_cart_link']")
    And scroll("//button[@id='checkout']").click()
    And focus('#first-name')
    And input('#first-name','Rutvi')
    And input('#last-name','Mohta')
    And input('#postal-code','422101')
    And driver.click("//input[@id='continue']")
    * delay(2000)

    * call read('classpath:com/ui/automation/completeflow/handle_alert.feature')

    # Complete checkout
    And click("//button[@name='finish']")
    * delay(1000)
    Given driver 'https://www.saucedemo.com/checkout-complete.html'
    And click("//button[@class='btn btn_primary btn_small']")

    Examples: 
      | username      | password     |
      | standard_user | secret_sauce |
