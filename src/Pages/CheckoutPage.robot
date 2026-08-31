*** Settings ***
Resource    ../Resources/Browser.robot

*** Keywords ***
Add Backpack To Cart
    Wait For Stable Element    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    id:remove-sauce-labs-backpack

Open Cart
    Wait For Stable Element    css:[data-test="shopping-cart-link"]
    Click Element    css:[data-test="shopping-cart-link"]
    Wait Until Location Contains    /cart.html
    Wait Until Element Is Visible    id:checkout

Start Checkout
    Wait For Stable Element    id:checkout
    Click Button    id:checkout
    Wait Until Element Is Visible    id:first-name

Fill Customer Information
    Wait For Stable Element    id:first-name
    Input Text    id:first-name    Pessoa
    Wait For Stable Element    id:last-name
    Input Text    id:last-name    Teste
    Wait For Stable Element    id:postal-code
    Input Text    id:postal-code    00000
    Wait For Stable Element    id:continue
    Click Button    id:continue
    Wait Until Location Contains    /checkout-step-two.html
    Wait Until Element Is Visible    css:[data-test="total-label"]

Backpack Totals Should Match
    Element Text Should Be    css:[data-test="subtotal-label"]    Item total: $29.99
    Element Text Should Be    css:[data-test="tax-label"]    Tax: $2.40
    Element Text Should Be    css:[data-test="total-label"]    Total: $32.39

Finish And Confirm Order
    Wait For Stable Element    id:finish
    Click Button    id:finish
    Wait Until Location Contains    /checkout-complete.html
    Wait Until Element Is Visible    css:[data-test="complete-header"]
    Element Text Should Be    css:[data-test="complete-header"]    Thank you for your order!
    Page Should Not Contain Element    css:[data-test="shopping-cart-badge"]
    Capture Page Screenshot    checkout-concluido.png
