*** Settings ***
Library    SeleniumLibrary    timeout=15s

*** Variables ***
${URL}    %{BASE_URL}

*** Keywords ***
Open Store
    Open Browser    ${URL}    headlesschrome
    Set Window Size    1280    900
    Wait Until Element Is Visible    id:login-button
