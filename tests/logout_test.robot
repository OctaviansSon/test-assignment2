*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Logout From DemoBlaze
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element   //*[@id="login2"]
    Wait Until Element Is Visible    id=loginusername
    Input Text      id=loginusername    ${USERNAME}
    Input Text      id=loginpassword    ${PASSWORD}
    Click Button    //button[text()="Log in"]
    Wait Until Page Contains    Welcome ${USERNAME}
    Click Element   //*[@id="logout2"]
    Wait Until Element Is Visible    //*[@id="login2"]
    [Teardown]    Close Browser
