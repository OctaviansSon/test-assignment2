*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Buy Product Successfully
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element   //*[@id="login2"]
    Wait Until Element Is Visible    id=loginusername
    Input Text      id=loginusername    ${USERNAME}
    Input Text      id=loginpassword    ${PASSWORD}
    Click Button    //button[text()="Log in"]
    Wait Until Page Contains    Welcome ${USERNAME}

    # Выбор товара
    Click Element   //a[text()="Samsung galaxy s6"]
    Wait Until Page Contains    Add to cart
    Click Element   //a[text()="Add to cart"]
    Sleep    2s
    Handle Alert    accept

    # Переход в корзину и оформление заказа
    Click Element   //*[@id="cartur"]
    Wait Until Page Contains    Place Order
    Click Element   //button[text()="Place Order"]
    Input Text      id=name    ${USERNAME}
    Input Text      id=country    Kazakhstan
    Input Text      id=city       Shymkent
    Input Text      id=card       4111111111111111
    Input Text      id=month      10
    Input Text      id=year       2025
    Click Button    //button[text()="Purchase"]
    Wait Until Page Contains    Thank you for your purchase!
    Click Button    //button[text()="OK"]
    [Teardown]    Close Browser
