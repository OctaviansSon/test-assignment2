*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Logout User
    Open Browser    ${URL}    remote_url=${REMOTE_URL}    browser=${BROWSER}    desired_capabilities=${BS_CAPS}




    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    1s
    Execute JavaScript    document.getElementById("login2").click()

    Wait Until Element Is Visible    //*[@id="loginusername"]
    Input Text    //*[@id="loginusername"]    ${USERNAME}
    Input Text    //*[@id="loginpassword"]    ${PASSWORD}
    Click Button    //*[@onclick="logIn()"]
    Wait Until Page Contains    Welcome ${USERNAME}

    Execute JavaScript    document.getElementById("logout2").click()
    Wait Until Element Is Visible    //*[@id="login2"]

    Close Browser
