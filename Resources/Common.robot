*** Settings ***
Documentation     Common library across the entire test suite

Library    SeleniumLibrary

*** Variables ***
${chrome_browser}    chrome
${firefox_browser}    firefox
${link}    https://www.bbc.com/

*** Keywords ***

Begin Chrome Web Test
    [Documentation]    Test Setup opens a browser
    Open Browser    about:blank    ${chrome_browser}
    Maximize Browser Window

Begin Firefox Web Test
    [Documentation]    Test Setup opens a browser
    Open Browser    about:blank    ${firefox_browser}
    Maximize Browser Window

End Web Test
    [Documentation]    Closes the browser
    Close Browser

Go To BBC News Page
     Go To    ${link}