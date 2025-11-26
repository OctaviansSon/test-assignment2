*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Buy Product Successfully
    # Открытие через BrowserStack
    Open Browser    ${URL}    remote_url=${REMOTE_URL}    browser=${BROWSER}    desired_capabilities=${BS_CAPS}

    # Чтобы не перекрывало каруселью
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    1s

    # Открываем окно логина через JS (чтобы не блокировалось)
    Execute JavaScript    document.getElementById("login2").click()

    Wait Until Element Is Visible    //*[@id="loginusername"]
    Input Text    //*[@id="loginusername"]    ${USERNAME}
    Input Text    //*[@id="loginpassword"]    ${PASSWORD}
    Click Button    //*[@onclick="logIn()"]
    Wait Until Page Contains    Welcome ${USERNAME}    10s

    # Кликаем на товар
    Click Link    Nexus 6

    # ЖДЁМ, пока появится кнопка "Add to cart"
    Wait Until Page Contains Element    //*[@class="btn btn-success btn-lg"]    15s

    # Кликаем через JavaScript — УБИРАЕТ ВСЕ ПРОБЛЕМЫ В BS
    Execute JavaScript    document.querySelector(".btn.btn-success.btn-lg").click()

    Sleep    2s
    Handle Alert    accept

    # Переходим в корзину
    Click Link    Cart
    Wait Until Page Contains    Nexus 6    10s

    # Оформляем заказ
    Click Button    //*[@class="btn btn-success"]
    Wait Until Element Is Visible    //*[@id="card"]    10s

    Input Text    //*[@id="name"]    ${USERNAME}
    Input Text    //*[@id="card"]    1111222233334444
    Execute JavaScript    document.querySelector('#month').value='12'
    Execute JavaScript    document.querySelector('#year').value='2025'

    Click Button    //*[@onclick="purchaseOrder()"]
    Wait Until Page Contains    Thank you for your purchase!

    Close Browser
