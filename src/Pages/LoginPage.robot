*** Settings ***
Resource    ../Resources/Browser.robot

*** Keywords ***
Login As
    [Arguments]    ${username}=%{TEST_USER}
    Wait For Stable Element    id:user-name
    Input Text    id:user-name    ${username}
    Wait For Stable Element    id:password
    Input Password    id:password    %{TEST_PASSWORD}
    Wait For Stable Element    id:login-button
    Click Button    id:login-button

Catalog Should Be Open
    Wait Until Location Contains    /inventory.html
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack
