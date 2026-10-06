*** Settings ***
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/CheckoutPage.robot

*** Keywords ***
Complete Checkout
    Login As
    Catalog Should Be Open
    Add Backpack To Cart
    Open Cart
    Element Text Should Be    css:[data-test="inventory-item-name"]    Sauce Labs Backpack
    Start Checkout
    Fill Customer Information
    Backpack Totals Should Match
    Finish And Confirm Order

Reject Locked User
    Login As    %{LOCKED_USER}
    Wait Until Element Is Visible    css:[data-test="error"]
    Element Should Contain    css:[data-test="error"]    Sorry, this user has been locked out.
    Location Should Be    ${URL}

Require Customer Name
    Login As
    Catalog Should Be Open
    Add Backpack To Cart
    Open Cart
    Start Checkout
    Wait For Stable Element    id:continue
    Click Button    id:continue
    Wait Until Element Is Visible    css:[data-test="error"]
    Element Text Should Be    css:[data-test="error"]    Error: First Name is required
    Location Should Contain    /checkout-step-one.html

Remove Backpack From Cart
    Login As
    Catalog Should Be Open
    Add Backpack To Cart
    Open Cart
    Wait For Stable Element    id:remove-sauce-labs-backpack
    Click Button    id:remove-sauce-labs-backpack
    Wait Until Page Does Not Contain Element    css:[data-test="inventory-item"]
    Page Should Not Contain Element    css:[data-test="shopping-cart-badge"]

Resume Checkout After Cancelling Customer Form
    Login As
    Catalog Should Be Open
    Add Backpack To Cart
    Open Cart
    Start Checkout
    Input Text    id:first-name    Pessoa
    Wait For Stable Element    id:cancel
    Click Button    id:cancel
    Wait Until Location Contains    /cart.html
    Wait Until Element Is Visible    css:[data-test="inventory-item-name"]
    Element Text Should Be    css:[data-test="inventory-item-name"]    Sauce Labs Backpack
    Element Text Should Be    css:[data-test="shopping-cart-badge"]    1
    Start Checkout
    Fill Customer Information
    Backpack Totals Should Match
    Finish And Confirm Order
    Open Cart
    Page Should Not Contain Element    css:[data-test="inventory-item"]
