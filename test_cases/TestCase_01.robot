*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.jimms.fi/
${allMenus}   //*[@id="sitemegamenu"]/nav/ul[1]/li/a

*** Test Cases ***
LandingPage
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    2
    ${menuElements} =    Get WebElements    ${allMenus}

    FOR    ${menu}    IN    @{menuElements}
        Click Element    ${menu}
        Sleep    5
    END