*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Sign Up New User
    Open Browser    ${URL}    remote_url=${REMOTE_URL}    browser=${BROWSER}    desired_capabilities=${BS_CAPS}


    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    1s
    Execute JavaScript    document.getElementById("signin2").click()

    Wait Until Element Is Visible    //*[@id="sign-username"]
    Input Text    //*[@id="sign-username"]    ${USERNAME}
    Input Text    //*[@id="sign-password"]    ${PASSWORD}
    Click Button    //*[@onclick="register()"]

    Sleep    2s
    Handle Alert    accept

    Close Browser
