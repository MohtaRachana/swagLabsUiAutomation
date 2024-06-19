Feature: Select all product present on the home page

  Background: 
    * configure driver = { type: 'chrome' }

  Scenario Outline: valid login
    Given driver 'https://www.saucedemo.com/'
    And input('#user-name', '<username>')
    And input('#password', '<password>')
    * delay(2000)
    And click('#login-button')
    * driver.maximize()
    * delay(2000)
    #select all product
    Given driver 'https://www.saucedemo.com/inventory.html'
    #select the items
    And click("//button[@id='add-to-cart-sauce-labs-backpack']")
    And click("//button[@id='add-to-cart-sauce-labs-bike-light']")
    And click("//button[@id='add-to-cart-sauce-labs-bolt-t-shirt']")
    * delay(3000)
    #click on cart icon
    And click("//a[@class='shopping_cart_link']")
    * delay(3000)
    #cart page
    Given driver 'https://www.saucedemo.com/cart.html'
    * def page_title = driver.title
    And print page_title
    And match page_title contains 'Swag Labs'
    #remove from cart
    * delay(3000)
    And click("//button[@id='remove-sauce-labs-backpack']")
    * driver.back()
    * delay(2000)
    # add items to cart
    And click("//button[@name='add-to-cart-test.allthethings()-t-shirt-(red)']")
    * delay(1000)
    And click("//a[@class='shopping_cart_link']")
    * delay(1000)
    # added new item in the cart
    Given driver 'https://www.saucedemo.com/cart.html'
    And scroll("//button[@id='continue-shopping']").click()
    * delay(1000)
    # Inventory page
    Given driver 'https://www.saucedemo.com/inventory.html'
    * delay(1000)
    And click("//button[@id='add-to-cart-sauce-labs-backpack']")
    And click("//a[@class='shopping_cart_link']")
    And scroll("//button[@id='checkout']").click()
    And focus('#first-name')
    And input('#first-name','Rutvi')
    And input('#last-name','Mohta')
    And input('#postal-code','422101')
    And click("//input[@id='continue']")
    Given driver 'https://www.saucedemo.com/checkout-step-two.html'
    And click("//button[@name='finish']")
    And delay(1000)
    Given driver 'https://www.saucedemo.com/checkout-complete.html'
    And click("//button[@class='btn btn_primary btn_small']")


    Examples: 
      | username      | password     |
      | standard_user | secret_sauce |
