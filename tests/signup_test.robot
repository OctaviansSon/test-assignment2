*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Sign Up New User
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element   //*[@id="signin2"]
    Wait Until Element Is Visible    id=sign-username
    Input Text      id=sign-username    ${USERNAME}
    Input Text      id=sign-password    ${PASSWORD}
    Click Button    //button[text()="Sign up"]
    Sleep    2s
    Handle Alert    accept
    Close Browser
