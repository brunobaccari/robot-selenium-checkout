*** Settings ***
Library    SeleniumLibrary    timeout=15s
Library    ../Helpers/StableElement.py

*** Variables ***
${URL}    %{BASE_URL}

*** Keywords ***
Open Store
    Open Browser    ${URL}    headlesschrome
    ...    options=add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False})
    Set Window Size    1280    900
    Wait Until Element Is Visible    id:login-button
