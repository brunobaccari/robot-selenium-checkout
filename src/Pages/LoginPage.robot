*** Settings ***
Resource    ../Resources/Browser.robot

*** Keywords ***
Login As
    [Arguments]    ${username}=%{TEST_USER}
    Input Text    id:user-name    ${username}
    Input Password    id:password    %{TEST_PASSWORD}
    Click Button    id:login-button

Catalog Should Be Open
    Wait Until Location Contains    /inventory.html
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack
