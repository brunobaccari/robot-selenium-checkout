*** Settings ***
Resource    ../Resources/Browser.robot

*** Keywords ***
Add Backpack To Cart
    Click Button    id:add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    id:remove-sauce-labs-backpack

Open Cart
    Click Element    css:[data-test="shopping-cart-link"]
    Wait Until Location Contains    /cart.html

Start Checkout
    Click Button    id:checkout
    Wait Until Element Is Visible    id:first-name

Fill Customer Information
    Input Text    id:first-name    Pessoa
    Input Text    id:last-name    Teste
    Input Text    id:postal-code    00000
    Click Button    id:continue
    Wait Until Location Contains    /checkout-step-two.html

Backpack Totals Should Match
    Element Text Should Be    css:[data-test="subtotal-label"]    Item total: $29.99
    Element Text Should Be    css:[data-test="tax-label"]    Tax: $2.40
    Element Text Should Be    css:[data-test="total-label"]    Total: $32.39

Finish And Confirm Order
    Click Button    id:finish
    Wait Until Location Contains    /checkout-complete.html
    Element Text Should Be    css:[data-test="complete-header"]    Thank you for your order!
    Page Should Not Contain Element    css:[data-test="shopping-cart-badge"]
    Capture Page Screenshot    checkout-concluido.png
