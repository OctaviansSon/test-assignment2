*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://www.demoblaze.com/
${USERNAME}      yasik_test1
${PASSWORD}      123456

${BROWSERSTACK_USERNAME}      binarbi_bBHfed
${BROWSERSTACK_ACCESS_KEY}    4xfuGGGLvyQtRuV5EKtv

${REMOTE_URL}    https://${BROWSERSTACK_USERNAME}:${BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub

&{BS_CAPS}
...    browserName=${BROWSER}
...    browserVersion=latest
...    platformName=Windows 11
...    name=${TEST_NAME}
